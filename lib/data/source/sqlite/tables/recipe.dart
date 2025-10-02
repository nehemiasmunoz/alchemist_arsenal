import 'package:drift/drift.dart';

class Recipe extends Table {
  IntColumn get recipeId => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get instructions => text()();
}
