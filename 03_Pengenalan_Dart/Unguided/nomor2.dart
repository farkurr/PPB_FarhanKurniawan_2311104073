import 'dart:io';

void main() {
  stdout.write('Masukkan tinggi piramida: ');
  int tinggi = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= tinggi; i++) {
    // spasi
    for (int j = 1; j <= tinggi - i; j++) {
      stdout.write(' ');
    }

    // bintang
    for (int k = 1; k <= (2 * i - 1); k++) {
      stdout.write('*');
    }

    // pindah baris
    print('');
  }
}
