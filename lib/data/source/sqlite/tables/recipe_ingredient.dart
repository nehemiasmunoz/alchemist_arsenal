import 'package:alchemist_arsenal/data/source/sqlite/tables/tables.dart';
import 'package:drift/drift.dart';

class RecipeIngredient extends Table {
  IntColumn get id => integer().autoIncrement()();
  ColumnBuilder<int> get recipeId => integer().references(Recipe, #id);
  ColumnBuilder<int> get ingredientId => integer().references(Ingredient, #id);
  TextColumn get unitOfMeasure => text()();
  Column<double> get quantity => real()();
}
