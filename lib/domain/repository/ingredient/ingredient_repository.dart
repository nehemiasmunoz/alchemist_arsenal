import 'package:alchemist_arsenal/data/daos/daos.dart';
import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';

class IngredientRepository {
  final IngredientDao _ingredientDao;

  IngredientRepository(IngredientDao ingredientDao)
    : _ingredientDao = ingredientDao;

  Stream<List<IngredientData>> getIngredients() {
    return _ingredientDao.watchAllIngredients();
  }

  Future<void> saveIngredient(IngredientCompanion ingredient) {
    return _ingredientDao.saveIngredient(ingredient);
  }

  Future<void> updateIngredient(IngredientCompanion ingredient) {
    return _ingredientDao.updateIngredient(ingredient);
  }

  Future<void> deleteIngredient(int id) {
    return _ingredientDao.deleteIngredient(id);
  }
}
