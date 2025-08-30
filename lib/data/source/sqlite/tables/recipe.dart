import 'package:drift/drift.dart';

class Recipe extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get instructions => text()();
}
