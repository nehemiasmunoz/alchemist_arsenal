import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';
import 'package:drift/drift.dart';
import 'package:alchemist_arsenal/data/source/sqlite/tables/ingredient.dart';

part 'ingredient_dao.g.dart';

@DriftAccessor(tables: [Ingredient])
class IngredientDao extends DatabaseAccessor<AppDatabase>
    with _$IngredientDaoMixin {
  IngredientDao(super.attachedDatabase);

  Stream<List<IngredientData>> watchAllIngredients() {
    return (select(ingredient)).watch();
  }

  Future<void> saveIngredient(IngredientCompanion newIngredient) {
    return into(ingredient).insert(newIngredient);
  }

  Future<void> updateIngredient(IngredientCompanion newIngredient) {
    return update(ingredient).replace(newIngredient);
  }

  Future<void> deleteIngredient(int id) {
    return (delete(
      ingredient,
    )..where((ingredient) => ingredient.id.equals(id))).go();
  }
}
