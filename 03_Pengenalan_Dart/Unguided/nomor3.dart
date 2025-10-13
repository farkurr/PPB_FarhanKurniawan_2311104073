import 'dart:io';

bool cekPrima(int n) {
  if (n < 2) return false;
  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}

void main() {
  stdout.write('Masukkan bilangan: ');
  int angka = int.parse(stdin.readLineSync()!);

  if (cekPrima(angka)) {
    print('bilangan prima');
  } else {
    print('bukan bilangan prima');
  }
}
