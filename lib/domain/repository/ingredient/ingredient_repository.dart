import 'package:alchemist_arsenal/data/daos/daos.dart';
import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';

class IngredientRepository {
  final IngredientDao _ingredientDao;

  IngredientRepository(IngredientDao ingredientDao)
    : _ingredientDao = ingredientDao;

  Stream<List<IngredientData>> getIngredients() {
    return _ingredientDao.watchAllIngredients();
  }

  Future<int> saveIngredient(IngredientCompanion ingredient) async {
    return await _ingredientDao.saveIngredient(ingredient);
  }

  Future<bool> updateIngredient(IngredientCompanion ingredient) async {
    return await _ingredientDao.updateIngredient(ingredient);
  }

  Future<int> deleteIngredient(int id) async {
    return await _ingredientDao.deleteIngredient(id);
  }
}
