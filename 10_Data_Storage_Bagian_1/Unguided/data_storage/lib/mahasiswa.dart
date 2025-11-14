class Mahasiswa {
  int? id;
  String nama;
  String nim;
  String alamat;
  String hobi;

  Mahasiswa({
    this.id,
    required this.nama,
    required this.nim,
    required this.alamat,
    required this.hobi,
  });

  factory Mahasiswa.fromMap(Map<String, dynamic> json) => Mahasiswa(
        id: json['id'],
        nama: json['nama'],
        nim: json['nim'],
        alamat: json['alamat'],
        hobi: json['hobi'],
      );

  Map<String, dynamic> toMap() {
    return {
      'nama': nama,
      'nim': nim,
      'alamat': alamat,
      'hobi': hobi,
    };
  }
}
