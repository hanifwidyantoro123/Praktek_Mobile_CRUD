// import 'package:drift/drift.dart' as drift;
// import 'package:drift/drift.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

import 'package:drift/drift.dart';

@DataClassName('Category')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 128)();
  IntColumn get type => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}
