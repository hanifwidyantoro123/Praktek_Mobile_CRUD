import 'package:flutter/material.dart';

class MenuPengeluaran extends StatelessWidget {
  const MenuPengeluaran({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Pengeluaran"),
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
                TextField(),
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
                    onPressed: () {},
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
