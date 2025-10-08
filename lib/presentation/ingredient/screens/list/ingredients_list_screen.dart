import 'package:alchemist_arsenal/config/routes/routes_app.dart';
import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';
import 'package:alchemist_arsenal/presentation/providers.dart';
import 'package:alchemist_arsenal/presentation/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IngredientsListScreen extends StatelessWidget {
  const IngredientsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Todo: replace stream with future<list>
    return StreamProvider<List<IngredientData>>(
      initialData: const [],
      create: (context) => context.read<IngredientProvider>().watchAll(),
      child: Consumer<List<IngredientData>>(
        builder: (context, ingredients, child) {
          if (ingredients.isEmpty) {
            return Center(child: Text("No ingredients found."));
          }
          return ListView.separated(
            separatorBuilder: (_, __) => Divider(),
            itemCount: ingredients.length,
            itemBuilder: (ctx, i) {
              return _DismissibleIngredientItem(ingredient: ingredients[i]);
            },
          );
        },
      ),
    );
  }
}

class _DismissibleIngredientItem extends StatelessWidget {
  const _DismissibleIngredientItem({required this.ingredient});

  final IngredientData ingredient;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
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
              "Delete ${ingredient.title}".toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
            const Icon(Icons.delete, color: Colors.white),
          ],
        ),
      ),
      onDismissed: (direction) {
        context.read<IngredientProvider>().deleteIngredient(
          ingredient.ingredientId,
        );
      },
      key: Key(ingredient.toString()),
      child: _IngredientItem(ingredient: ingredient),
    );
  }
}

class _IngredientItem extends StatelessWidget {
  final IngredientData ingredient;

  const _IngredientItem({required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) =>
                CreateEditIngredientScreen(oldDataIngredient: ingredient),
          ),
        );
        context.read<RoutesApp>().changeOptionsVisibility(false);
      },
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
