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
        // Database was just created, perform any necessary setup
        await batch((batch) {
          batch.insertAll(unitOfMeasure, [
            UnitOfMeasureCompanion.insert(
              name: "Molarity",
              symbol: "M",
              description: Value.absentIfNull(
                "A unit of concentration defined as the number of moles of a solute per liter of solution.",
              ),
            ),
            UnitOfMeasureCompanion.insert(
              name: "Molality",
              symbol: "m",
              description: Value.absentIfNull(
                "A unit of concentration defined as the number of moles of a solute per kilogram of solvent.",
              ),
            ),
            UnitOfMeasureCompanion.insert(
              name: "Mole",
              symbol: "mol",
              description: Value.absentIfNull(
                "The SI base unit for the amount of substance, equal to Avogadro's number of particles (atoms, molecules, ions, etc.).",
              ),
            ),
            UnitOfMeasureCompanion.insert(
              name: "Gram",
              symbol: "g",
              description: Value.absentIfNull(
                "A unit of mass, commonly used to measure the mass of substances in a chemical reaction.",
              ),
            ),
            UnitOfMeasureCompanion.insert(
              name: "Kilogram",
              symbol: "kg",
              description: Value.absentIfNull(
                "The SI base unit for mass, used for larger quantities of substances.",
              ),
            ),
            UnitOfMeasureCompanion.insert(
              name: "Liter",
              symbol: "L",
              description: Value.absentIfNull(
                "A metric unit of volume, frequently used to measure the volume of liquid solutions.",
              ),
            ),
            UnitOfMeasureCompanion.insert(
              name: "Milliliter",
              symbol: "mL",
              description: Value.absentIfNull(
                "A metric unit of volume equal to one-thousandth of a liter, used for small volumes of liquids.",
              ),
            ),
            UnitOfMeasureCompanion.insert(
              name: "Celsius",
              symbol: "°C",
              description: Value.absentIfNull(
                "A unit of temperature, commonly used in laboratory settings to measure reaction temperatures.",
              ),
            ),
            UnitOfMeasureCompanion.insert(
              name: "Kelvin",
              symbol: "K",
              description: Value.absentIfNull(
                "The SI base unit of thermodynamic temperature, used in many scientific formulas.",
              ),
            ),
            UnitOfMeasureCompanion.insert(
              name: "Joule",
              symbol: "J",
              description: Value.absentIfNull(
                "The SI unit of energy, used to measure the heat absorbed or released during a chemical reaction.",
              ),
            ),
            UnitOfMeasureCompanion.insert(
              name: "Pascal",
              symbol: "Pa",
              description: Value.absentIfNull(
                "The SI unit of pressure, used to measure the pressure of gases in a system.",
              ),
            ),
            UnitOfMeasureCompanion.insert(
              name: "Atmosphere",
              symbol: "atm",
              description: Value.absentIfNull(
                "A non-SI unit of pressure, often used for convenience in chemistry and physics.",
              ),
            ),
            UnitOfMeasureCompanion.insert(
              name: "Gram per mole",
              symbol: "g/mol",
              description: Value.absentIfNull(
                "A unit of molar mass, representing the mass of one mole of a substance.",
              ),
            ),
            UnitOfMeasureCompanion.insert(
              name: "Mole per liter",
              symbol: "mol/L",
              description: Value.absentIfNull(
                "Another way to express Molarity (M), representing the amount of solute in a given volume of solution.",
              ),
            ),
            UnitOfMeasureCompanion.insert(
              name: "Concentration",
              symbol: "C",
              description: Value.absentIfNull(
                "A general term for the amount of a substance in a defined space, commonly expressed in units like Molarity or molality.",
              ),
            ),
          ]);
        });
      }
    },
  );
}
