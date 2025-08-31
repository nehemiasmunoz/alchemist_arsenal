import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';
import 'package:alchemist_arsenal/presentation/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipesListScreen extends StatelessWidget {
  const RecipesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return StreamProvider<List<RecipeData>>(
      initialData: [],
      create: (context) => context.read<RecipeProvider>().watchAllRecipes(),
      child: Container(
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (ctx, i) => SizedBox(
            height: size.height * .2,
            child: Card(
              child: Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text("Recipe title"),
                      subtitle: Text("Description"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
