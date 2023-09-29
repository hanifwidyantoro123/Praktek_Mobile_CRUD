import 'package:crud_app/models/database.dart';
import 'package:flutter/material.dart';

class MenuPemasukan extends StatelessWidget {
  MenuPemasukan({Key? key}) : super(key: key);

  final AppDatabase database = AppDatabase();
  TextEditingController categoryNameController = TextEditingController();

  Future insert(String name, int type) async {
    DateTime now = DateTime.now();
    final row = await database.into(database.categories).insert(
        CategoriesCompanion.insert(name: name, type: type, createdAt: now));
    print(row);
  }

  // void main() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   final dbHelper = DatabaseHelper();
  //   await dbHelper.initDatabase();
  //   runApp(MyApp());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Pemasukan"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Tanggal"),
                TextField(),
                SizedBox(
                  height: 20,
                ),
                Text("Nominal"),
                TextField(
                  controller: categoryNameController,
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Keterangan"),
                TextField(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orangeAccent,
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    onPressed: () {},
                    child: Text(
                      "Reset",
                      style: TextStyle(fontSize: 21),
                    ))),
            SizedBox(
              height: 20,
            ),
            Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    onPressed: () {
                      insert(categoryNameController.text, 1);
                    },
                    child: Text(
                      "Simpan",
                      style: TextStyle(fontSize: 21),
                    ))),
            SizedBox(
              height: 20,
            ),
            Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    onPressed: () {},
                    child: Text(
                      "Kembali",
                      style: TextStyle(fontSize: 21),
                    ))),
          ],
        ),
      )),
    );
  }
}
