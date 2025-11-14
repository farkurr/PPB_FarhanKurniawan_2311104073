import 'package:flutter/material.dart';
import 'mahasiswa.dart';
import 'db_helper.dart';

class AddMahasiswaPage extends StatefulWidget {
  const AddMahasiswaPage({super.key});

  @override
  State<AddMahasiswaPage> createState() => _AddMahasiswaPageState();
}

class _AddMahasiswaPageState extends State<AddMahasiswaPage> {
  final namaCtrl = TextEditingController();
  final nimCtrl = TextEditingController();
  final alamatCtrl = TextEditingController();
  final hobiCtrl = TextEditingController();

  DBHelper db = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Tambah Biodata Mahasiswa"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            field(Icons.person, "Nama", namaCtrl),
            field(Icons.confirmation_number, "NIM", nimCtrl),
            field(Icons.home, "Alamat", alamatCtrl),
            field(Icons.star, "Hobi", hobiCtrl),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
              ),
              onPressed: () async {
                await db.insertMahasiswa(Mahasiswa(
                  nama: namaCtrl.text,
                  nim: nimCtrl.text,
                  alamat: alamatCtrl.text,
                  hobi: hobiCtrl.text,
                ));
                Navigator.pop(context);
              },
              child: const Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }

  Widget field(IconData icon, String hint, TextEditingController ctrl) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: ctrl,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
