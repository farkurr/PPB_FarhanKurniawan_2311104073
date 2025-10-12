void main() {
  // Contoh pemanggilan fungsi
  cariNilaiDalamList(2);
  print('');
  cariNilaiDalamList(5);
}

void cariNilaiDalamList(int target) {
  // Buat List 2 dimensi
  List<List<int>> data = [];

  // Baris 1: 3 bilangan kelipatan 5 mulai dari 5
  List<int> baris1 = [];
  for (int i = 1; i <= 3; i++) {
    baris1.add(i * 5);
  }
  data.add(baris1);

  // Baris 2: 4 bilangan genap mulai dari 2
  List<int> baris2 = [];
  int even = 2;
  for (int i = 0; i < 4; i++) {
    baris2.add(even);
    even += 2;
  }
  data.add(baris2);

  // Baris 3: 5 bilangan kuadrat dari 1
  List<int> baris3 = [];
  for (int i = 1; i <= 5; i++) {
    baris3.add(i * i);
  }
  data.add(baris3);

  // Baris 4: 6 bilangan asli mulai dari 3
  List<int> baris4 = [];
  for (int i = 3; i < 3 + 6; i++) {
    baris4.add(i);
  }
  data.add(baris4);

  // Tampilkan isi list
  print('Isi List:');
  for (var baris in data) {
    print(baris.join(' '));
  }

  // Cari nilai target
  print('\nBilangan yang dicari: $target');
  bool found = false;
  for (int i = 0; i < data.length; i++) {
    for (int j = 0; j < data[i].length; j++) {
      if (data[i][j] == target) {
        print('baris ${i + 1} kolom ${j + 1}');
        found = true;
      }
    }
  }

  if (!found) {
    print('Nilai $target tidak ditemukan dalam list.');
  }
}
