import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praktikum/mvc/controller/controller.dart';

class MvcView extends StatelessWidget {
  const MvcView({super.key});

  @override
  Widget build(BuildContext context) {
    MahasiswaController _mahasiswaController = Get.put(MahasiswaController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _mahasiswaController.tambahData("Carmen", "23111104011", 3.5);
              },
              child: Text("Tambah Data"),
            ),
            Obx(
              () => SizedBox(
                height: 600,
                child: ListView.builder(
                  itemCount: _mahasiswaController.listMahasiswa.length,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      title: Text(
                        _mahasiswaController.listMahasiswa[index].nama,
                      ),
                      subtitle: Text(
                        "NIM : ${_mahasiswaController.listMahasiswa[index].nim} |  IPK : ${_mahasiswaController.listMahasiswa[index].ipk}",
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          _mahasiswaController.hapusData(index);
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
              Text("Jumlah :  ${_mahasiswaController.listMahasiswa.length}"),
              Text("Rata - rata :  ${_mahasiswaController.hitungData()}"),
            ],
          ),
        ),
      ),
    );
  }
}
