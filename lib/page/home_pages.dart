import 'package:crud_app/page/cashflow.dart';
import 'package:crud_app/page/menu_cashflow.dart';
import 'package:crud_app/page/pemasukan.dart';
import 'package:crud_app/page/pengeluaran.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<MenuItem> menuItems = [
    MenuItem(
      title: 'Tambah Pemasukan',
      icon: Icons.paid,
      onTap: (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MenuPemasukan()),
        );
      },
    ),
    MenuItem(
      title: 'Tambah Pengeluaran',
      icon: Icons.money_off,
      onTap: (BuildContext context) {
        // Tambahkan logika untuk menu 2 di sini
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MenuPengeluaran()),
        );
      },
    ),
    MenuItem(
      title: 'Detail Cash Flow',
      icon: Icons.event,
      onTap: (BuildContext context) {
        // Tambahkan logika untuk menu 3 di sini
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Menu_CashFlow()),
        );
      },
    ),
    MenuItem(
      title: 'Pengaturan',
      icon: Icons.settings,
      onTap: (BuildContext context) {
        // Tambahkan logika untuk menu 4 di sini
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rangkuman Bulan Ini',
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(
                child: Card(
                  elevation: 0.1,
                  color: Colors.red,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Pengeluaran : Rp 20.000",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: Card(
                  color: Colors.green,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Pemasukan : Rp 100.000",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.amber,
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: menuItems.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        menuItems[index].onTap(
                            context); // Perhatikan penggunaan context di sini
                      },
                      child: Card(
                        elevation: 3.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(menuItems[index].icon, size: 48.0),
                            SizedBox(height: 8.0),
                            Text(menuItems[index].title),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem {
  final String title;
  final IconData icon;
  final Function(BuildContext context) onTap;

  MenuItem({required this.title, required this.icon, required this.onTap});
}
