import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(Menu_CashFlow());
}

class Transaction {
  final String title;
  final double amount;
  final DateTime date;
  final bool
      isExpense; // Menandakan apakah transaksi adalah pengeluaran atau pembelian

  Transaction({
    required this.title,
    required this.amount,
    required this.date,
    required this.isExpense,
  });
}

class Menu_CashFlow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Riwayat Transaksi'),
        ),
        body: TransactionList(transactions: [
          Transaction(
              title: 'Belanja Bulan Ini',
              amount: 500.0,
              date: DateTime.now(),
              isExpense: false),
          Transaction(
              title: 'Pembayaran Tagihan',
              amount: -200.0,
              date: DateTime.now().subtract(
                Duration(days: 2),
              ),
              isExpense: true),
          // Tambahkan data transaksi lainnya sesuai kebutuhan
        ]),
      ),
    );
  }
}

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        // Tentukan ikon berdasarkan jenis transaksi
        Icon icon = transactions[index].isExpense
            ? Icon(Icons.arrow_downward, color: Colors.red) // Pengeluaran
            : Icon(Icons.arrow_upward, color: Colors.green); // Pembelian

        return Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: FittedBox(
                  child: Text(
                      '\$${transactions[index].amount.toStringAsFixed(2)}'),
                ),
              ),
            ),
            title: Text(
              transactions[index].title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              DateFormat.yMMMd().format(transactions[index].date),
            ),
            trailing: icon,
          ),
        );
      },
    );
  }
}
