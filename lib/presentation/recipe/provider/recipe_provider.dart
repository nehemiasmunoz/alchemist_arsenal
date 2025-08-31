import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';
import 'package:alchemist_arsenal/domain/repository/repositories.dart';

class RecipeProvider {
  final RecipeRepository _recipeRepository;

  RecipeProvider({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  Stream<List<RecipeData>> watchAllRecipes() {
    return _recipeRepository.watchAllRecipes();
  }
}
