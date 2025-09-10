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

  Future<int> saveIngredient(IngredientCompanion newIngredient) async {
    return await into(ingredient).insert(newIngredient);
  }

  Future<bool> updateIngredient(IngredientCompanion newIngredient) async {
    return await update(ingredient).replace(newIngredient);
  }

  Future<int> deleteIngredient(int id) async {
    return await (delete(
      ingredient,
    )..where((ingredient) => ingredient.id.equals(id))).go();
  }
}
