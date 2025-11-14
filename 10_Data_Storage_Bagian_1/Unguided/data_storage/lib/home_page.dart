import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'mahasiswa.dart';
import 'add_mahasiswa_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Mahasiswa> listMhs = [];
  DBHelper db = DBHelper();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    listMhs = await db.getMahasiswa();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("SQLite Biodata Mahasiswa"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddMahasiswaPage()),
          );
          loadData();
        },
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: listMhs.length,
        itemBuilder: (context, i) {
          final m = listMhs[i];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black12)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(m.nama,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text("NIM     : ${m.nim}"),
                Text("Alamat : ${m.alamat}"),
                Text("Hobi     : ${m.hobi}"),
              ],
            ),
          );
        },
      ),
    );
  }
}
