import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';
import 'package:drift/drift.dart';
import 'package:alchemist_arsenal/data/source/sqlite/tables/tables.dart';

part 'recipe_dao.g.dart';

@DriftAccessor(tables: [Recipe])
class RecipeDao extends DatabaseAccessor<AppDatabase> with _$RecipeDaoMixin {
  RecipeDao(super.attachedDatabase);

  Stream<List<RecipeData>> watchAllRecipes() {
    return (select(recipe)).watch();
  }

  Future<RecipeData> getRecipeById(int id) async {
    return await (select(recipe)..where((r) => r.id.equals(id))).getSingle();
  }

  Future<int> saveRecipe(RecipeCompanion newRecipe) async {
    return await into(recipe).insert(newRecipe);
  }

  Future<bool> updateRecipe(RecipeCompanion newRecipe) async {
    return await update(recipe).replace(newRecipe);
  }

  Future<int> deleteRecipe(int id) async {
    return await (delete(recipe)..where((recipe) => recipe.id.equals(id))).go();
  }
}
