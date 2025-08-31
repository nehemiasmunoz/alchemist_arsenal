import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';
import 'package:alchemist_arsenal/domain/repository/repositories.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

class IngredientProvider extends ChangeNotifier {
  final IngredientRepository _ingredientRepo;
  IngredientData? recentDeletedIngredient;
  IngredientProvider(IngredientRepository ingredientRepo)
    : _ingredientRepo = ingredientRepo;

  Stream<List<IngredientData>> get watchAll => _ingredientRepo.getIngredients();

  Future<void> _createIngredient(IngredientCompanion newIngredient) {
    return _ingredientRepo.saveIngredient(newIngredient);
  }

  void submitForm(
    int? id,
    String title,
    String price,
    String description,
    String properties,
  ) {
    IngredientCompanion newIngredient = IngredientCompanion(
      id: Value.absentIfNull(id),
      title: Value(title),
      price: Value(double.parse(price)),
      description: Value(description),
      properties: Value(properties),
    );
    if (id != null) {
      _updateIngredient(newIngredient);
    } else {
      _createIngredient(newIngredient);
    }
  }

  Future<void> _updateIngredient(IngredientCompanion newIngredient) {
    return _ingredientRepo.updateIngredient(newIngredient);
  }

  Future<void> deleteIngredient(int id) {
    return _ingredientRepo.deleteIngredient(id);
  }
}
