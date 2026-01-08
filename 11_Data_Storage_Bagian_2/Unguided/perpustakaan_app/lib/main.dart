import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ftqbehknlpmnxpcwzfwr.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0cWJlaGtubHBtbnhwY3d6ZndyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc4NTk5ODUsImV4cCI6MjA4MzQzNTk4NX0.iMp36oQ2xhl_7AGESUK9m8p6qvKZsXJT-rAzI0Je4Nk',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final supabase = Supabase.instance.client;

  // CREATE DATA
  Future<void> insertBuku() async {
    await supabase.from('perpustakaan').insert({
      'judul': 'Laskar Pelangi',
      'penulis': 'Andrea Hirata',
      'tahun_terbit': 2005,
      'genre': 'Novel',
    });

    print('Data buku berhasil ditambahkan');
  }

  // READ DATA
  Future<void> getBuku() async {
    final data = await supabase.from('perpustakaan').select();

    print('===== DATA PERPUSTAKAAN =====');
    for (var buku in data) {
      print(
        'Judul: ${buku['judul']} | '
        'Penulis: ${buku['penulis']} | '
        'Tahun: ${buku['tahun_terbit']} | '
        'Genre: ${buku['genre']}',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Supabase Perpustakaan')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: insertBuku,
              child: const Text('Insert Data Buku'),
            ),
            ElevatedButton(
              onPressed: getBuku,
              child: const Text('Get Data Buku'),
            ),
          ],
        ),
      ),
    );
  }
}
