import 'package:sqflite/sqflite.dart' as sql;

class SQLHelperCrud {
  //fungsi database
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""
    CREATE TABLE pemasukan(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      tanggal TEXT,
      nominal TEXT,
      keterangan TEXT 
    )
    """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('pemasukan.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  //menambah database
  static Future<int> tambahCatatanPemasukan(
      String tanggal, String nominal, String keterangan) async {
    final db = await SQLHelperCrud.db();
    final data = {
      'tanggal': tanggal,
      'nominal': nominal,
      'keterangan': keterangan
    };
    return await db.insert('pemasukan', data);
  }

  //mengambil data
  static Future<List<Map<String, dynamic>>> getCatatanPemasukan() async {
    final db = await SQLHelperCrud.db();
    return db.query('pemasukan');
  }
}
