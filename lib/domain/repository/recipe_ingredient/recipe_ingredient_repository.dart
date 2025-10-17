import 'package:alchemist_arsenal/data/daos/daos.dart';
import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';
import '../../models/recipeIngredient/recipe_ingredient_model.dart';

class RecipeIngredientRepository {
  final RecipeIngredientDao _recipeIngredientDao;

  RecipeIngredientRepository({required RecipeIngredientDao recipeIngredientDao})
    : _recipeIngredientDao = recipeIngredientDao;

  void saveAllRecipeIngredients(
    List<RecipeIngredientCompanion> ingredients,
  ) async {
    await _recipeIngredientDao.saveAllIngredients(ingredients);
  }

  Future<List<RecipeIngredientModel>> getAllIngredientsWhereRecipe(
    int recipeId,
  ) async {
    return await _recipeIngredientDao.getAllIngredientsWhereRecipe(recipeId);
  }

  Future<void> deleteAllIngredientsWhere(List<int> idsToDelete) async {
    return await _recipeIngredientDao.deleteAllIngredientsWhere(idsToDelete);
  }
}
