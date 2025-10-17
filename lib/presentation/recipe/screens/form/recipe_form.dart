import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';
import 'package:alchemist_arsenal/domain/models/recipeIngredient/recipe_ingredient_model.dart';
import 'package:alchemist_arsenal/presentation/providers.dart';
import 'package:alchemist_arsenal/presentation/widgets/add_ingredient_form.dart';
import 'package:alchemist_arsenal/presentation/widgets/widgets.dart';
import 'package:alchemist_arsenal/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipeForm extends StatefulWidget {
  const RecipeForm({super.key, this.oldRecipeData});

  final RecipeData? oldRecipeData;

  @override
  State<RecipeForm> createState() => _RecipeFormState();
}

class _RecipeFormState extends State<RecipeForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleTFController = TextEditingController();
  final _descriptionTFController = TextEditingController();
  final _instructionsTFController = TextEditingController();

  @override
  void initState() {
    if (widget.oldRecipeData != null) {
      var oldData = widget.oldRecipeData!;
      _titleTFController.value = TextEditingValue(text: oldData.title);
      _descriptionTFController.value = TextEditingValue(
        text: oldData.description,
      );
      _instructionsTFController.value = TextEditingValue(
        text: oldData.instructions,
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.reset();
    _titleTFController.dispose();
    _descriptionTFController.dispose();
    _instructionsTFController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var recipeProvider = context.read<RecipeProvider>();
    var recipeIngredientProvider = context.read<RecipeIngredientProvider>();
    recipeIngredientProvider.clearIngredients();
    if (widget.oldRecipeData != null) {
      recipeIngredientProvider.getAllIngredientsFromRecipe(
        widget.oldRecipeData!.recipeId,
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              spacing: size.width * .02,
              children: [
                CustomTextField(
                  label: "Title",
                  maxLines: 1,
                  maxLength: 50,
                  controller: _titleTFController,
                  validator: (value) =>
                      Validator.validateIsNotEmpty(value, "Title"),
                ),
                CustomTextField(
                  label: "Description",
                  maxLength: 100,
                  validator: (value) =>
                      Validator.validateIsNotEmpty(value, "Description"),
                  controller: _descriptionTFController,
                ),

                CustomTextField(
                  label: "Instructions",
                  controller: _instructionsTFController,
                  maxLength: 300,
                  validator: (value) =>
                      Validator.validateIsNotEmpty(value, "Instructions"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ingredients List",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () => showAdaptiveDialog(
                        context: context,
                        builder: (ctx) => CustomAlertDialog(
                          title: "Add Ingredient",
                          content: AddIngredientForm(),
                        ),
                      ),
                      child: Text("Add Ingredient"),
                    ),
                  ],
                ),
                SizedBox(height: size.height * .2, child: IngredientsList()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: size.width * .05,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.red[300]),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final int recipeId = await recipeProvider.submitForm(
                            widget.oldRecipeData?.recipeId,
                            _titleTFController.text,
                            _descriptionTFController.text,
                            _instructionsTFController.text,
                          );

                          recipeIngredientProvider.saveData(recipeId);
                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                        }
                      },
                      child: Text("Save"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IngredientsList extends StatelessWidget {
  const IngredientsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeIngredientProvider>(
      builder: (ctx, provider, child) {
        var ingredients = provider.ingredients;
        if (ingredients.isEmpty) {
          return Text("Ingredient list empty");
        }
        return ListView.builder(
          itemCount: ingredients.length,
          itemBuilder: (context, i) {
            var ingredient = ingredients[i];
            return IngredientItem(
              ingredient: ingredient,
              onDelete: provider.removeIngredientFromList,
            );
          },
        );
      },
    );
  }
}

class IngredientItem extends StatelessWidget {
  const IngredientItem({
    super.key,
    required this.ingredient,
    required this.onDelete,
  });

  final RecipeIngredientModel ingredient;
  final Function onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          " ${ingredient.quantity} ${ingredient.unit.symbol} | ${ingredient.ingredient.title}",
        ),
        IconButton(
          onPressed: () => onDelete(ingredient),
          icon: Icon(Icons.close),
        ),
      ],
    );
  }
}
