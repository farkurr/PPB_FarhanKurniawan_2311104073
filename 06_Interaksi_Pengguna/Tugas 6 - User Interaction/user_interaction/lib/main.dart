import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List Dialog Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Data List
  final List<Map<String, dynamic>> appList = const [
    {
      'name': 'Native App',
      'platform': 'Android, iOS',
      'language': 'Kotlin, Swift, Java',
      'color': Colors.red,
    },
    {
      'name': 'Hybrid App',
      'platform': 'Android, iOS, Web',
      'language': 'Javascript, Dart',
      'color': Colors.grey,
    },
  ];

  // Fungsi untuk menampilkan dialog detail
  void showDetailDialog(BuildContext context, Map<String, dynamic> data) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text(
            'Detail',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                data['name'],
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text('${data['platform']}\n${data['language']}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close', style: TextStyle(color: Colors.green)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView Dialog Example')),
      body: ListView.builder(
        itemCount: appList.length,
        itemBuilder: (context, index) {
          final item = appList[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: ListTile(
              leading: CircleAvatar(backgroundColor: item['color']),
              title: Text(
                item['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              onTap: () => showDetailDialog(context, item),
            ),
          );
        },
      ),
    );
  }
}
