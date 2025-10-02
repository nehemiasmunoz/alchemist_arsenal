import 'dart:developer';

import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';
import 'package:alchemist_arsenal/data/source/sqlite/tables/ingredient.dart';
import 'package:drift/drift.dart';

part 'ingredient_dao.g.dart';

@DriftAccessor(tables: [Ingredient])
class IngredientDao extends DatabaseAccessor<AppDatabase>
    with _$IngredientDaoMixin {
  IngredientDao(super.attachedDatabase);

  Stream<List<IngredientData>> watchAllIngredients() {
    final result = (select(ingredient)).watch();
    log("Watching all ingredients");
    return result;
  }

  Future<int> saveIngredient(IngredientCompanion newIngredient) async {
    final query = into(ingredient).insert(newIngredient);
    try {
      final result = await query;
      log("Ingredient successfully saved $newIngredient");
      return result;
    } catch (e, stackTrace) {
      log("Error saving ingredient $newIngredient $e", stackTrace: stackTrace);
    }
    return -1;
  }

  Future<bool> updateIngredient(IngredientCompanion newIngredient) async {
    final query = update(ingredient).replace(newIngredient);
    try {
      final result = await query;
      log("Ingredient successfully updated");
      return result;
    } catch (e, stackTrace) {
      log("Error updating ingredient $newIngredient", stackTrace: stackTrace);
    }
    return false;
  }

  Future<int> deleteIngredient(int id) async {
    final query = delete(ingredient)
      ..where((ingredient) => ingredient.ingredientId.equals(id));
    try {
      final result = await query.go();
      log("Ingredient successfully deleted");
      return result;
    } catch (e, stackTrace) {
      log("Error deleting ingredient id:$id $e", stackTrace: stackTrace);
    }
    return -1;
  }
}
