import 'package:flutter/material.dart';

void main() {
  runApp(const WisataApp());
}

class WisataApp extends StatelessWidget {
  const WisataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekomendasi Wisata Banyumas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple, fontFamily: 'Roboto'),
      home: const RekomendasiWisataPage(),
    );
  }
}

class RekomendasiWisataPage extends StatelessWidget {
  const RekomendasiWisataPage({super.key});

  // List destinasi wisata
  final List<Map<String, String>> wisataList = const [
    {
      'nama': 'Baturaden',
      'gambar': 'assets/images/baturaden.jpeg',
      'deskripsi':
          'Wisata alam di lereng Gunung Slamet dengan udara sejuk dan pemandangan indah. Cocok untuk rekreasi keluarga.',
    },
    {
      'nama': 'Curug Cipendok',
      'gambar': 'assets/images/curug_cipendok.jpeg',
      'deskripsi':
          'Air terjun setinggi 92 meter yang menyuguhkan panorama alam asri dan udara segar khas pegunungan.',
    },
    {
      'nama': 'Telaga Sunyi',
      'gambar': 'assets/images/telaga_sunyi.jpeg',
      'deskripsi':
          'Telaga alami dengan air jernih kebiruan yang menenangkan. Spot favorit untuk relaksasi dan foto estetik.',
    },
    {
      'nama': 'Museum Banyumas',
      'gambar': 'assets/images/museum_banyumas.jpeg',
      'deskripsi':
          'Museum sejarah yang menyimpan koleksi benda-benda peninggalan Banyumas tempo dulu, cocok untuk wisata edukasi.',
    },
    {
      'nama': 'Small World',
      'gambar': 'assets/images/small_world.jpeg',
      'deskripsi':
          'Taman miniatur dunia dengan berbagai replika landmark terkenal, cocok untuk wisata keluarga dan spot foto unik.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        title: const Text(
          'Wisata Banyumas',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        elevation: 4,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: wisataList.length,
        itemBuilder: (context, index) {
          final wisata = wisataList[index];

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  child: Image.asset(
                    wisata['gambar']!,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        wisata['nama']!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        wisata['deskripsi']!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Menuju ke halaman ${wisata['nama']}...',
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple.shade100,
                            foregroundColor: Colors.purple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text('Kunjungi'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
