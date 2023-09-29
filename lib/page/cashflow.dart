import 'dart:core';
import 'dart:ffi';

import 'package:crud_app/models/sql_helper.dart';
import 'package:crud_app/models/sql_helper_crud.dart';
import 'package:flutter/material.dart';

class MenuCashFlow extends StatefulWidget {
  const MenuCashFlow({super.key});

  @override
  State<MenuCashFlow> createState() => _MenuCashFlowState();
}

class _MenuCashFlowState extends State<MenuCashFlow> {
  TextEditingController tanggalController = TextEditingController();
  TextEditingController nominalController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();

  @override
  void initState() {
    refereshCatatnPemasukan();
    super.initState();
  }

  //Mengambil Database
  List<Map<String, dynamic>> pemasukan = [];
  void refereshCatatnPemasukan() async {
    final data = await SQLHelperCrud.getCatatanPemasukan();
    setState(() {
      pemasukan = data;
    });
  }

  // DatabaseInstance? databaseInstance;
  // void iniState() {
  //   databaseInstance = DatabaseInstance();
  //   initDatabase();
  //   super.initState();
  // }

  // Future initDatabase() async {
  //   await databaseInstance!.database();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("CashFLow"),
    //   ),

    // );

    print(pemasukan);
    return Scaffold(
      appBar: AppBar(
        title: Text("CashFlow"),
      ),
      body: ListView.builder(
          itemCount: pemasukan.length,
          itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                    title: Text(pemasukan[index]['nominal']),
                    subtitle: Text(pemasukan[index]['keterangan']),
                    leading: Container(
                      child: Icon(
                        Icons.upload,
                        color: Colors.red,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                    )),
              ))
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Container(
      //     child: Card(
      //       elevation: 10,
      //       child: FutureBuilder<List<TransaksiModel>>(
      //           future: databaseInstance!.getAll(),
      //           builder: (context, Snapshot) {
      //             print('HASIL :' + Snapshot.data.toString());
      //             if (Snapshot.connectionState == ConnectionState.waiting) {
      //               return Text("Loading");
      //             } else {
      //               if (Snapshot.hasData) {}
      //             }

      //             return ListView.builder(
      //                 itemCount: Snapshot.data!.length,
      //                 itemBuilder: (context, index) {
      //                   return Expanded(
      //                     child: ListTile(
      //                         title: Text("Rp. 25.000"),
      //                         subtitle:
      //                             Text("Dapat bayaran panitia setifikasi"),
      //                         leading: Container(
      //                           child: Icon(
      //                             Icons.download,
      //                             color: Colors.green,
      //                           ),
      //                           decoration: BoxDecoration(
      //                               color: Colors.white,
      //                               borderRadius: BorderRadius.circular(8)),
      //                         )),
      //                   );
      //                 });
      //           }),
      //     ),
      //   ),
      // ),

      ,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     modalFormPemasukan();
      //   },
      //   child: const Icon(Icons.add),
      // )
    );
  }

  // fungsi tambahan
  Future<void> tambahCatatanPemasukan() async {
    await SQLHelperCrud.tambahCatatanPemasukan(tanggalController.text,
        nominalController.text, keteranganController.text);
    refereshCatatnPemasukan();
  }

  //form tambah
  // void modalFormPemasukan() async {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (_) => Container(
  //             padding: const EdgeInsets.all(15),
  //             width: double.infinity,
  //             height: 800,
  //             child: SingleChildScrollView(
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.end,
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   TextField(
  //                     controller: tanggalController,
  //                     decoration: const InputDecoration(hintText: 'tanggal'),
  //                   ),
  //                   const SizedBox(
  //                     height: 10,
  //                   ),
  //                   TextField(
  //                     controller: nominalController,
  //                     decoration: const InputDecoration(hintText: 'nominnal'),
  //                   ),
  //                   TextField(
  //                     controller: keteranganController,
  //                     decoration: const InputDecoration(hintText: 'keterangan'),
  //                   ),
  //                   const SizedBox(
  //                     height: 20,
  //                   ),
  //                   ElevatedButton(
  //                       onPressed: () async {
  //                         await tambahCatatanPemasukan();
  //                         tanggalController.text = '';
  //                         nominalController.text = '';
  //                         keteranganController.text = '';
  //                         Navigator.pop(context);
  //                       },
  //                       child: const Text('tambah'))
  //                 ],
  //               ),
  //             ),
  //           )
  //           );
  // }
}
