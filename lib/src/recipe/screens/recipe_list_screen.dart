import 'package:flutter/material.dart';

class RecipesListScreen extends StatelessWidget {
  const RecipesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
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
    );
  }
}
