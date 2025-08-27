import 'package:alchemist_arsenal/src/ingredient/screens/forms/ingredient_form.dart';
import 'package:alchemist_arsenal/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CreateIngredient extends StatelessWidget {
  const CreateIngredient({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: "Create Ingredient",
      content: IngredientForm(),
    );
  }
}
