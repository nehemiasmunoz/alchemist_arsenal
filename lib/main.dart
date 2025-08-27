import 'package:alchemist_arsenal/config/routes/routes_app.dart';
import 'package:alchemist_arsenal/data/daos/daos.dart';
import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';
import 'package:alchemist_arsenal/domain/repository/ingredient_repository.dart';
import 'package:alchemist_arsenal/src/ingredient/provider/ingredient_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  final database = AppDatabase();
  final ingredientDao = IngredientDao(database);
  final ingredientRepository = IngredientRepository(ingredientDao);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RoutesApp()),
        ChangeNotifierProvider(
          create: (_) => IngredientProvider(ingredientRepository),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RoutesApp.initialRoute,
      routes: RoutesApp.routes,
    );
  }
}
