import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praktikum/mvvm/viewModel/viewModel.dart';

class MvvmView extends StatelessWidget {
  const MvvmView({super.key});

  @override
  Widget build(BuildContext context) {
    MahasiswaViewModel mahasiswaviewmodel = Get.put(MahasiswaViewModel());
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                mahasiswaviewmodel.tambahData("Carmen", "23111104011", 3.5);
              },
              child: Text("Tambah Data"),
            ),
            Obx(
              () => SizedBox(
                height: 600,
                child: ListView.builder(
                  itemCount: mahasiswaviewmodel.listMahasiswa.length,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      title: Text(mahasiswaviewmodel.listMahasiswa[index].nama),
                      subtitle: Text(
                        "NIM : ${mahasiswaviewmodel.listMahasiswa[index].nim} |  IPK : ${mahasiswaviewmodel.listMahasiswa[index].ipk}",
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          mahasiswaviewmodel.hapusData(index);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          child: Row(
            children: [
              Text(mahasiswaviewmodel.jumlahMahasiswa),
              Text(mahasiswaviewmodel.ratarataMahasiswa),
            ],
          ),
        ),
      ),
    );
  }
}
