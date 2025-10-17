import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';
import 'package:alchemist_arsenal/presentation/providers.dart';
import 'package:alchemist_arsenal/presentation/screens.dart';
import 'package:alchemist_arsenal/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipesListScreen extends StatelessWidget {
  const RecipesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var recipeProvider = context.watch<RecipeProvider>();

    if (recipeProvider.isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    if (recipeProvider.recipes.isEmpty) {
      return Center(child: Text("No recipes found."));
    }

    return ListView.separated(
      separatorBuilder: (_, __) => Divider(),
      itemCount: recipeProvider.recipes.length,
      itemBuilder: (ctx, i) {
        var recipe = recipeProvider.recipes[i];
        return _RecipeItem(recipe: recipe);
      },
    );
  }
}

class _RecipeItem extends StatelessWidget {
  const _RecipeItem({required this.recipe});

  final RecipeData recipe;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CreateEditRecipeScreen(oldRecipeData: recipe),
        ),
      ),
      title: Text(recipe.title),
      subtitle: recipe.description != ""
          ? Text(recipe.description, textAlign: TextAlign.left)
          : null,
      trailing: IconButton(
        onPressed: () {
          showAdaptiveDialog(
            context: context,
            builder: (ctx) => CustomAlertDialog(
              title: "Delete Recipe",
              content: Text("Do you really want to delete ${recipe.title}"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<RecipeProvider>().deleteRecipe(
                      recipe.recipeId,
                    );
                    Navigator.pop(ctx);
                  },
                  child: Text("Confirm"),
                ),
              ],
            ),
          );
        },
        icon: Icon(Icons.delete, color: Colors.red[300]),
      ),
    );
  }
}
