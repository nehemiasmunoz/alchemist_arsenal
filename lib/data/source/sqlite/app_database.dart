import 'package:alchemist_arsenal/data/source/sqlite/tables/tables.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Ingredient, Recipe, RecipeIngredient, UnitOfMeasure])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'alchemist_arsenal',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
    beforeOpen: (details) async {
      if (details.wasCreated) {
        await batch((batch) {
          batch.insertAll(unitOfMeasure, [
            UnitOfMeasureCompanion.insert(
              name: "Gram",
              symbol: "g",
              description: Value(
                "A unit of mass, commonly used to measure the mass of substances in a chemical reaction.",
              ),
            ),
            UnitOfMeasureCompanion.insert(
              name: "Kilogram",
              symbol: "kg",
              description: Value(
                "The SI base unit for mass, used for larger quantities of substances.",
              ),
            ),
            UnitOfMeasureCompanion.insert(
              name: "Liter",
              symbol: "L",
              description: Value(
                "A metric unit of volume, frequently used to measure the volume of liquid solutions.",
              ),
            ),
            UnitOfMeasureCompanion.insert(
              name: "Milliliter",
              symbol: "mL",
              description: Value(
                "A metric unit of volume equal to one-thousandth of a liter, used for small volumes of liquids.",
              ),
            ),
          ]);
        });
      }
    },
  );
}
