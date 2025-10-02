import 'package:alchemist_arsenal/data/daos/recipe/recipe_dao.dart';
import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';

class RecipeRepository {
  final RecipeDao _recipeDao;
  RecipeRepository(RecipeDao recipeDao) : _recipeDao = recipeDao;

  Stream<List<RecipeData>> watchAllRecipes() {
    return _recipeDao.watchAllRecipes();
  }

  Future<int> createRecipe(RecipeCompanion newRecipe) async {
    return await _recipeDao.createRecipe(newRecipe);
  }

  Future<bool> updateRecipe(RecipeCompanion newRecipe) async {
    return await _recipeDao.updateRecipe(newRecipe);
  }

  Future<int> deleteRecipe(int id) async {
    return await _recipeDao.deleteRecipe(id);
  }
}
