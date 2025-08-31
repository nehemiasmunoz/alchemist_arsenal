import 'package:alchemist_arsenal/data/daos/recipe/recipe_dao.dart';
import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';

class RecipeRepository {
  final RecipeDao _recipeDao;
  RecipeRepository(RecipeDao recipeDao) : _recipeDao = recipeDao;

  Stream<List<RecipeData>> watchAllRecipes() {
    return _recipeDao.watchAllRecipes();
  }

  Future<void> saveRecipe(RecipeCompanion newRecipe) {
    return _recipeDao.saveRecipe(newRecipe);
  }

  Future<void> updateRecipe(RecipeCompanion newRecipe) {
    return _recipeDao.updateRecipe(newRecipe);
  }

  Future<void> deleteRecipe(int id) {
    return _recipeDao.deleteRecipe(id);
  }
}
