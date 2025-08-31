import 'package:alchemist_arsenal/presentation/screens.dart';
import 'package:alchemist_arsenal/presentation/widgets/widgets.dart';
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
