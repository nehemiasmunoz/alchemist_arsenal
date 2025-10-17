import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';
import 'package:alchemist_arsenal/presentation/recipe/screens/form/recipe_form.dart';
import 'package:flutter/material.dart';

class CreateEditRecipeScreen extends StatelessWidget {
  const CreateEditRecipeScreen({super.key, this.oldRecipeData});
  final RecipeData? oldRecipeData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(oldRecipeData != null ? "Edit Recipe" : "Create Recipe"),
        centerTitle: true,
      ),
      body: RecipeForm(oldRecipeData: oldRecipeData),
    );
  }
}
