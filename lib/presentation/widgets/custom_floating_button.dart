import 'package:alchemist_arsenal/config/routes/routes_app.dart';
import 'package:alchemist_arsenal/presentation/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: context.read<RoutesApp>().optionsVisibility,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: size.width * .05,
                children: [
                  ElevatedButton(onPressed: null, child: Text("New Recipe")),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => CreateEditIngredientScreen(),
                        ),
                      );
                      context.read<RoutesApp>().changeOptionsVisibility(false);
                    },
                    child: Text("New Ingredient"),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * .02),
            FloatingActionButton(
              onPressed: () =>
                  context.read<RoutesApp>().changeOptionsVisibility(null),
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
