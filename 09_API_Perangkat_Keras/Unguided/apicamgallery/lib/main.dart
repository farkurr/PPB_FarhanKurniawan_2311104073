import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    cameras = await availableCameras();
  } catch (e) {
    print("Error initializing cameras: $e");
  }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API Perangkat Keras',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  XFile? _selectedImage;
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Perangkat Keras"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Tampilkan gambar jika ada
              Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: _selectedImage != null
                    ? Image.file(File(_selectedImage!.path), fit: BoxFit.cover)
                    : const Center(
                        child: Text(
                          "Belum ada gambar",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
              ),

              const SizedBox(height: 20),

              /// Tombol Gallery
              ElevatedButton(
                onPressed: () async {
                  final image = await picker.pickImage(
                    source: ImageSource.gallery,
                    imageQuality: 75,
                  );

                  if (image != null) {
                    setState(() {
                      _selectedImage = image;
                    });
                  }
                },
                child: const Text("Gallery"),
              ),

              const SizedBox(height: 16),

              /// Tombol Camera
              ElevatedButton(
                onPressed: () async {
                  final image = await picker.pickImage(
                    source: ImageSource.camera,
                    imageQuality: 75,
                  );

                  if (image != null) {
                    setState(() {
                      _selectedImage = image;
                    });
                  }
                },
                child: const Text("Camera"),
              ),

              const SizedBox(height: 16),

              /// Tombol Hapus Gambar
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedImage = null;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
                child: const Text("Hapus Gambar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
