import 'package:employee_marcelalpinsanty/karyawan_service.dart';
import 'package:employee_marcelalpinsanty/screens/tambah_karyawan_screen.dart';
import 'package:flutter/material.dart';

class KaryawanListScreen extends StatefulWidget {
  const KaryawanListScreen({super.key});

  @override
  State<KaryawanListScreen> createState() => _KaryawanListScreenState();
}

class _KaryawanListScreenState extends State<KaryawanListScreen> {
  final KaryawanService _karyawanService = KaryawanService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Karyawan')),
      body: Column(
        children: [
          Expanded(
            child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                MaterialPageRoute(builder: (context) => TambahKaryawanScreen());
              },
            ),
          ),
          Expanded(
            child: StreamBuilder<Map<String, String>>(
              stream: _karyawanService.getKaryawanList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Map<String, String> items = snapshot.data!;
                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final key = items.keys.elementAt(index);
                      final item = items[key];
                      return ListTile(title: Text(item!));
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error : ${snapshot.error}"));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
