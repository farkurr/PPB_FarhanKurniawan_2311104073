import 'dart:io';

String cekNilai(int nilai) {
  if (nilai > 70) {
    return "$nilai merupakan Nilai A";
  } else if (nilai > 40 && nilai <= 70) {
    return "$nilai merupakan Nilai B";
  } else if (nilai > 0 && nilai <= 40) {
    return "$nilai merupakan Nilai C";
  } else {
    return "";
  }
}

void main() {
  stdout.write("Masukkan nilai: ");
  int input = int.parse(stdin.readLineSync()!);

  String hasil = cekNilai(input);
  print(hasil);
}
