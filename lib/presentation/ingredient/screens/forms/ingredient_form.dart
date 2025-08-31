import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';
import 'package:alchemist_arsenal/presentation/providers.dart';
import 'package:alchemist_arsenal/presentation/widgets/widgets.dart';
import 'package:alchemist_arsenal/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IngredientForm extends StatefulWidget {
  const IngredientForm({super.key, this.ingredientData});
  final IngredientData? ingredientData;
  @override
  State<IngredientForm> createState() => _IngredientFormState();
}

class _IngredientFormState extends State<IngredientForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleTFController = TextEditingController();
  final _priceTFController = TextEditingController();
  final _descriptionTFController = TextEditingController();
  final _propertiesTFController = TextEditingController();

  @override
  void dispose() {
    _titleTFController.dispose();
    _priceTFController.dispose();
    _descriptionTFController.dispose();
    _propertiesTFController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.ingredientData != null) {
      var ingredient = widget.ingredientData!;
      _titleTFController.value = TextEditingValue(text: ingredient.title);
      _priceTFController.value = TextEditingValue(
        text: ingredient.price.toString(),
      );
      _descriptionTFController.value = TextEditingValue(
        text: ingredient.description ?? "",
      );
      _propertiesTFController.value = TextEditingValue(
        text: ingredient.properties ?? "",
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var ingredientProvider = context.read<IngredientProvider>();
    return Form(
      key: _formKey,
      child: Column(
        spacing: 7.0,
        children: [
          CustomTextField(
            label: "Title",
            inputType: TextInputType.name,
            controller: _titleTFController,
            validator: (value) => Validator.validateIsNotEmpty(value, "Title"),
          ),
          CustomTextField(
            label: "Price",
            inputType: TextInputType.number,
            controller: _priceTFController,
            validator: (value) => Validator.validateIsNumber(value, "Price"),
          ),
          CustomTextField(
            label: "Description",
            inputType: TextInputType.text,
            controller: _descriptionTFController,
          ),
          CustomTextField(
            label: "Properties",
            inputType: TextInputType.text,
            controller: _propertiesTFController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ingredientProvider.submitForm(
                      widget.ingredientData?.id,
                      _titleTFController.text,
                      _priceTFController.text,
                      _descriptionTFController.text,
                      _propertiesTFController.text,
                    );
                    Navigator.of(context).pop();
                  }
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
