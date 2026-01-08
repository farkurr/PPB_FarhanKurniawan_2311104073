import 'package:get/get.dart';
import 'package:praktikum/mvvm/model/model.dart';

class MahasiswaViewModel extends GetxController {
  RxList listMahasiswa = <Mahasiswa>[].obs;

  String get jumlahMahasiswa => "Jumlah : ${listMahasiswa.length} mahasiswa";
  String get ratarataMahasiswa =>
      "Rata - rata : ${hitungRataRata().toStringAsFixed(2)}";

  void tambahData(String nama, String nim, double ipk) {
    Mahasiswa newMahasiswa = Mahasiswa(nama: nama, nim: nim, ipk: ipk);
    listMahasiswa.add(newMahasiswa);
  }

  void hapusData(int index) {
    listMahasiswa.removeAt(index);
  }

  double hitungRataRata() {
    if (listMahasiswa.isEmpty) return 0;
    double avg = 0;
    for (var mhs in listMahasiswa) {
      avg += mhs.ipk;
    }
    return avg / listMahasiswa.length;
  }
}
