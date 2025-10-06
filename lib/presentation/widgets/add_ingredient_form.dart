import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';
import 'package:alchemist_arsenal/presentation/providers.dart';
import 'package:alchemist_arsenal/presentation/widgets/widgets.dart';
import 'package:alchemist_arsenal/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddIngredientForm extends StatefulWidget {
  const AddIngredientForm({super.key});

  @override
  State<AddIngredientForm> createState() => _AddIngredientFormState();
}

class _AddIngredientFormState extends State<AddIngredientForm> {
  UnitOfMeasureData? unit;
  IngredientData? ingredient;
  var quantityTFController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    quantityTFController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8.0,
          children: [
            StreamBuilder<List<IngredientData>>(
              stream: context.read<IngredientProvider>().watchAll(),
              initialData: [],
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("No Ingredients Added");
                } else {
                  List<IngredientData> ingredients = snapshot.data!;
                  return DropdownMenu<IngredientData>(
                    onSelected: (value) => ingredient = value,
                    width: size.width * .6,
                    label: Text("Ingredient"),
                    dropdownMenuEntries: ingredients
                        .map<DropdownMenuEntry<IngredientData>>(
                          (ingredient) => DropdownMenuEntry(
                            value: ingredient,
                            label: ingredient.title,
                          ),
                        )
                        .toList(),
                  );
                }
              },
            ),

            Consumer<UnitOfMeasureProvider>(
              builder: (ctx, provider, child) {
                if (provider.isLoading) {
                  return Text("No data");
                }
                return DropdownMenu<UnitOfMeasureData>(
                  onSelected: (value) => unit = value,
                  width: size.width * .6,
                  label: Text("Unit of Measure"),
                  dropdownMenuEntries: provider.units
                      .map<DropdownMenuEntry<UnitOfMeasureData>>(
                        (unit) =>
                            DropdownMenuEntry(value: unit, label: unit.name),
                      )
                      .toList(),
                );
              },
            ),
            CustomTextField(
              label: "Quantity",
              controller: quantityTFController,
              validator: (value) =>
                  Validator.validateIsNumber(value, "Quantity"),
              inputType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context
                          .read<RecipeIngredientProvider>()
                          .addIngredientToList(
                            unit: unit!,
                            ingredient: ingredient!,
                            quantity: double.parse(quantityTFController.text),
                          );
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Add"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
