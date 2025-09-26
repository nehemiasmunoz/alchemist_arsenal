import 'package:drift/drift.dart';

class UnitOfMeasure extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get symbol => text().withLength(min: 1, max: 10)();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get description => text().nullable()();
}
