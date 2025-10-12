import 'dart:math';

void buatMatriksDanTranspose(int baris, int kolom) {
  final random = Random();

  List<List<int>> matriks = List.generate(
    baris,
    (_) => List.generate(kolom, (_) => random.nextInt(10)), // angka 0–9
  );

  print("Matriks AxB");
  print("A: $baris");
  print("B: $kolom");
  print("Isi matriks:");
  for (var row in matriks) {
    print(row.join(' '));
  }

  List<List<int>> transpose = List.generate(
    kolom,
    (i) => List.generate(baris, (j) => matriks[j][i]),
  );

  print("\nHasil transpose:");
  for (var row in transpose) {
    print(row.join(' '));
  }
}

void main() {
  buatMatriksDanTranspose(3, 2);
}
