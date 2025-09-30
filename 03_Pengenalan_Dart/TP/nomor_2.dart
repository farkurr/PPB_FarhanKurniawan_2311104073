void main() {
  // Menggunakan for loop
  int sumFor = 0;
  for (int i = 1; i <= 10; i++) {
    sumFor += i;
  }
  print("Jumlah dari 1 sampai 10 (for loop): $sumFor");

  // Menggunakan while loop
  int sumWhile = 0;
  int j = 1;
  while (j <= 10) {
    sumWhile += j;
    j++;
  }
  print("Jumlah dari 1 sampai 10 (while loop): $sumWhile");
}
