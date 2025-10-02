import 'dart:developer';

import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';
import 'package:alchemist_arsenal/data/source/sqlite/tables/tables.dart';
import 'package:alchemist_arsenal/domain/models/recipeIngredient/recipe_ingredient_model.dart';
import 'package:drift/drift.dart';

part 'recipe_ingredient_dao.g.dart';

@DriftAccessor(tables: [RecipeIngredient])
class RecipeIngredientDao extends DatabaseAccessor<AppDatabase>
    with _$RecipeIngredientDaoMixin {
  RecipeIngredientDao(super.attachedDatabase);

  Future<List<RecipeIngredientModel>> getAllIngredientsWhereRecipe(
    int recipeId,
  ) async {
    try {
      final query = select(recipeIngredient).join([
        innerJoin(
          ingredient,
          ingredient.ingredientId.equalsExp(recipeIngredient.ingredientId),
        ),
        innerJoin(
          unitOfMeasure,
          unitOfMeasure.unitOfMeasureId.equalsExp(
            recipeIngredient.unitOfMeasureId,
          ),
        ),
      ])..where(recipeIngredient.recipeId.equals(recipeId));

      final result = await query.map((row) {
        return RecipeIngredientModel(
          recipeIngredientId: row
              .readTable(recipeIngredient)
              .recipeIngredientId,
          quantity: row.readTable(recipeIngredient).quantity,
          ingredient: row.readTable(ingredient),
          unit: row.readTable(unitOfMeasure),
        );
      }).get();
      log(
        "Successfully fetched ${result.length} ingredients for recipe: $recipeId",
      );
      return result;
    } catch (e, stackTrace) {
      log(
        "Error fetching ingredients for recipe: $recipeId: $e",
        stackTrace: stackTrace,
      );
    }
    return [];
  }

  Future<bool> saveAllIngredients(
    List<RecipeIngredientCompanion> records,
  ) async {
    if (records.isEmpty) return false;
    try {
      await batch((batch) {
        return batch.insertAllOnConflictUpdate(recipeIngredient, records);
      });
      log(
        "Successfully executed batch insert/update for ${records.length} ingredients",
      );
      return true;
    } catch (e, stackTrace) {
      log(
        "Error executing batch insert/update for $records $e",
        stackTrace: stackTrace,
      );
      return false;
    }
  }

  Future<void> deleteAllIngredientsWhere(List<int> idsToDelete) async {
    if (idsToDelete.isEmpty) return;
    final query = delete(recipeIngredient);
    try {
      query.where((r) => r.recipeIngredientId.isIn(idsToDelete));
      await query.go();
      log("Ingredients successfully deleted");
    } catch (e, stackTrace) {
      log("Error deleting ingredients $idsToDelete $e", stackTrace: stackTrace);
    }
  }
}
