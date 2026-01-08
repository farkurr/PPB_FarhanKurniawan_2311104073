import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Controller untuk mengelola state counter
class CounterController extends GetxController {
  // Variabel observable untuk menyimpan nilai counter
  // .obs membuat variabel ini reactive (bisa diobservasi perubahannya)
  var counter = 0.obs;

  // Fungsi untuk menambah nilai counter
  void increment() {
    counter.value++;
  }

  // Fungsi untuk mereset nilai counter ke 0
  void reset() {
    counter.value = 0;
  }
}

class HomePage extends StatelessWidget {
  // Inisialisasi controller menggunakan Get.put()
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App"), backgroundColor: Colors.blue),
      body: Center(
        child: Obx(() {
          // Obx() akan rebuild widget ini setiap kali counter berubah
          return Text(
            "${controller.counter.value}", // Menampilkan nilai counter
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          );
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Memanggil fungsi increment untuk menambah counter
              controller.increment();
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.green,
            heroTag: "increment", // Menghindari konflik jika ada multiple FAB
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              // Memanggil fungsi reset untuk mereset counter ke 0
              controller.reset();
            },
            child: Icon(Icons.refresh),
            backgroundColor: Colors.orange,
            heroTag: "reset", // Menghindari konflik jika ada multiple FAB
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));
}
