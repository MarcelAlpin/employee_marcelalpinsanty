import 'package:flutter/material.dart';
import 'package:employee_marcelalpinsanty/karyawan_service.dart';

class TambahKaryawanScreen extends StatefulWidget {
  const TambahKaryawanScreen({super.key});

  @override
  State<TambahKaryawanScreen> createState() => _TambahKaryawanScreenState();
}

class _TambahKaryawanScreenState extends State<TambahKaryawanScreen> {
  final TextEditingController _textController = TextEditingController();
  final KaryawanService _karyawanService = KaryawanService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Karyawan')),
      body: Column(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(hintText: "Masukkan Nama Karyawan"),
            ),
          ),
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: "Masukkan Jabatan Karyawan",
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              _karyawanService.addKaryawanlist(_textController.text);
              _textController.clear();
            },
          ),
        ],
      ),
    );
  }
}
