class DataTransaksi {
  late int id;
  DateTime date;
  double nominal;
  String keterangan;

  DataTransaksi(
      {required this.date, required this.nominal, required this.keterangan});

  Map<String, dynamic> toMap() {
    return {
      'date': date.toIso8601String(),
      'nominal': nominal,
      'keterangan': keterangan,
    };
  }

  factory DataTransaksi.fromMap(Map<String, dynamic> map) {
    return DataTransaksi(
      date: DateTime.parse(map['date']),
      nominal: map['nominal'],
      keterangan: map['keterangan'],
    );
  }
}
