import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:praktikum/mvc/model/model.dart';

class MahasiswaController extends GetxController {
  RxList listMahasiswa = <Mahasiswa>[].obs;

  // Add
  void tambahData(String nama, String nim, double ipk) {
    Mahasiswa newMahasiswa = Mahasiswa(nama: nama, nim: nim, ipk: ipk);
    listMahasiswa.add(newMahasiswa);
  }

  // Delete
  void hapusData(int index) {
    listMahasiswa.removeAt(index);
  }

  // Average
  double hitungData() {
    if (listMahasiswa.isEmpty) return 0;
    double avg = 0;
    for (var mhs in listMahasiswa) {
      avg += mhs.ipk;
    }
    return avg / listMahasiswa.length;
  }
}
