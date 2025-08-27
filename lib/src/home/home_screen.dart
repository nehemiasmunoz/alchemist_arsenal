import 'package:alchemist_arsenal/config/routes/routes_app.dart';
import 'package:alchemist_arsenal/src/ingredient/screens/forms/create/create_ingredient.dart';
import 'package:alchemist_arsenal/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenProvider = context.watch<RoutesApp>();
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16.0),
        child: RoutesApp.screens[screenProvider.screenIndex],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAdaptiveDialog(
          builder: (context) => CreateIngredient(),
          context: context,
        ),
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
