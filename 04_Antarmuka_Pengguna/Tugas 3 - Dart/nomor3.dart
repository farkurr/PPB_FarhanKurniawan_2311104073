import 'dart:io';

// Fungsi untuk mencari FPB (Faktor Persekutuan Terbesar)
int cariFPB(int a, int b) {
  while (b != 0) {
    int sisa = a % b;
    a = b;
    b = sisa;
  }
  return a;
}

// Fungsi untuk mencari KPK
int cariKPK(int a, int b) {
  return (a * b) ~/ cariFPB(a, b);
}

void main() {
  stdout.write("Masukkan bilangan 1: ");
  int bil1 = int.parse(stdin.readLineSync()!);

  stdout.write("Masukkan bilangan 2: ");
  int bil2 = int.parse(stdin.readLineSync()!);

  int kpk = cariKPK(bil1, bil2);
  print("KPK $bil1 dan $bil2 = $kpk");
}
