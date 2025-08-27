import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';
import 'package:alchemist_arsenal/src/ingredient/provider/ingredient_provider.dart';
import 'package:alchemist_arsenal/src/ingredient/screens/forms/edit/edit_ingredient_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IngredientsListScreen extends StatelessWidget {
  const IngredientsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<IngredientData>>(
      initialData: const [],
      create: (context) => context.read<IngredientProvider>().watchAll,
      child: Scaffold(
        appBar: AppBar(title: Text("Ingredients")),
        body: Consumer<List<IngredientData>>(
          builder: (context, ingredients, child) {
            if (ingredients.isEmpty) {
              return Center(child: Text("No ingredients found."));
            }
            return ListView.builder(
              itemCount: ingredients.length,
              itemBuilder: (ctx, i) => Card(
                child: Dismissible(
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.red[300],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delete ${ingredients[i].title}".toUpperCase(),
                          style: TextStyle(color: Colors.white),
                        ),
                        const Icon(Icons.delete, color: Colors.white),
                      ],
                    ),
                  ),
                  onDismissed: (direction) {
                    context.read<IngredientProvider>().deleteIngredient(
                      ingredients[i].id,
                    );
                  },
                  key: Key(ingredients[i].toString()),
                  child: _IngredientItem(ingredient: ingredients[i]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _IngredientItem extends StatelessWidget {
  final IngredientData ingredient;

  const _IngredientItem({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => EditIngredientScreen(oldDataIngredient: ingredient),
        ),
      ),
      trailing: Text(
        "${ingredient.price}\$",
        overflow: TextOverflow.fade,
        style: TextStyle(fontSize: 18),
      ),
      title: Text(ingredient.title),
      subtitle: ingredient.description != ""
          ? Text(ingredient.description!)
          : null,
    );
  }
}
