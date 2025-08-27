import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';
import 'package:alchemist_arsenal/src/ingredient/screens/forms/ingredient_form.dart';
import 'package:flutter/material.dart';

class EditIngredientScreen extends StatelessWidget {
  const EditIngredientScreen({super.key, required this.oldDataIngredient});

  final IngredientData oldDataIngredient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ingredient"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IngredientForm(ingredientData: oldDataIngredient),
      ),
    );
  }
}
