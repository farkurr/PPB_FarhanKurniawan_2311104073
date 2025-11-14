import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'mahasiswa.dart';

class DBHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'mahasiswa.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE mahasiswa (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nama TEXT,
            nim TEXT,
            alamat TEXT,
            hobi TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertMahasiswa(Mahasiswa data) async {
    final db = await database;
    return db.insert('mahasiswa', data.toMap());
  }

  Future<List<Mahasiswa>> getMahasiswa() async {
    final db = await database;
    var res = await db.query("mahasiswa", orderBy: "id DESC");
    return res.map((e) => Mahasiswa.fromMap(e)).toList();
  }
}
