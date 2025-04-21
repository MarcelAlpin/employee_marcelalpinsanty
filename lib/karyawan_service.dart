import 'package:firebase_database/firebase_database.dart';

class KaryawanService {
  final DatabaseReference _database = FirebaseDatabase.instance.ref().child(
    'karyawan_list',
  );
  Stream<Map<String, String>> getKaryawanList() {
    return _database.onValue.map((event) {
      final Map<String, String> items = {};
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, value) {
          items[key] = value['name'] as String;
          items[key] = value['position'] as String;
        });
      }
      return items;
    });
  }

  void addKaryawanlist(String itemName) {
    _database.push().set({'name': itemName});
    _database.push().set({'position': itemName});
  }
}
