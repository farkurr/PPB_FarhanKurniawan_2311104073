import 'package:flutter/material.dart';
import 'controller.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  ApiService api = ApiService();
  List data = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await api.fetchData();
    setState(() {
      data = api.post;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("MockAPI CRUD")),
      body: data.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return ListTile(
                  title: Text(item["name"]),
                  subtitle: Text(item["nim"]),
                );
              },
            ),
    );
  }
}
