import 'package:drift/drift.dart';

class Ingredient extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  Column<double> get price => real()();
  TextColumn get properties => text().nullable()();
}
