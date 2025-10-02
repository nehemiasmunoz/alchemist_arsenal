import 'dart:developer';

import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';
import 'package:alchemist_arsenal/data/source/sqlite/tables/tables.dart';
import 'package:drift/drift.dart';

part 'recipe_dao.g.dart';

@DriftAccessor(tables: [Recipe])
class RecipeDao extends DatabaseAccessor<AppDatabase> with _$RecipeDaoMixin {
  RecipeDao(super.attachedDatabase);

  Stream<List<RecipeData>> watchAllRecipes() {
    final result = (select(recipe)).watch();
    log('Watching all recipes');
    return result;
  }

  Future<int> createRecipe(RecipeCompanion newRecipe) async {
    int recordId = -1;
    try {
      log("Recipe successfully created");
      recordId = await into(recipe).insert(newRecipe);
      return recordId;
    } catch (e, stackTrace) {
      log("Error creating recipe:$newRecipe $e", stackTrace: stackTrace);
    }
    return recordId;
  }

  Future<bool> updateRecipe(RecipeCompanion newRecipe) async {
    final query = update(recipe).replace(newRecipe);
    try {
      await query;
      log("Recipe successfully updated");
      return true;
    } catch (e, stackTrace) {
      log("Error updating recipe:$newRecipe $e", stackTrace: stackTrace);
    }
    return false;
  }

  Future<int> deleteRecipe(int id) async {
    final query = delete(recipe)..where((recipe) => recipe.recipeId.equals(id));
    try {
      final result = await query.go();
      log("Recipe successfully deleted");
      return result;
    } catch (e, stackTrace) {
      log("Error deleting recipe id: $id $e", stackTrace: stackTrace);
    }
    return -1;
  }
}
