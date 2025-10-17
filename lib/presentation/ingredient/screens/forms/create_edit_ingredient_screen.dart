import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';
import 'package:alchemist_arsenal/presentation/screens.dart';
import 'package:flutter/material.dart';

class CreateEditIngredientScreen extends StatelessWidget {
  const CreateEditIngredientScreen({super.key, this.oldDataIngredient});

  final IngredientData? oldDataIngredient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          oldDataIngredient != null ? "Edit Ingredient" : "Create Ingredient",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: IngredientForm(ingredientData: oldDataIngredient),
      ),
    );
  }
}
