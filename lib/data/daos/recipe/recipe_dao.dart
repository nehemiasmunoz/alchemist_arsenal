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

  Future<RecipeData> getRecipeById(int id) {
    return (select(recipe)..where((r) => r.id.equals(id))).getSingle();
  }

  Future<void> saveRecipe(RecipeCompanion newRecipe) {
    return into(recipe).insert(newRecipe);
  }

  Future<void> updateRecipe(RecipeCompanion newRecipe) {
    return update(recipe).replace(newRecipe);
  }

  Future<void> deleteRecipe(int id) {
    return (delete(recipe)..where((recipe) => recipe.id.equals(id))).go();
  }
}
