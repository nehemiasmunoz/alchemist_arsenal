import 'package:alchemist_arsenal/config/routes/routes_app.dart';
import 'package:alchemist_arsenal/data/daos/daos.dart';
import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';
import 'package:alchemist_arsenal/domain/repository/repositories.dart';
import 'package:alchemist_arsenal/presentation/providers.dart';
import 'package:alchemist_arsenal/presentation/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  final database = AppDatabase();
  final ingredientRepository = IngredientRepository(IngredientDao(database));
  final recipeRepository = RecipeRepository(RecipeDao(database));
  final unitOfMeasureRepository = UnitOfMeasureRepository(
    UnitOfMeasureDao(database),
  );
  final recipeIngredientRepository = RecipeIngredientRepository(
    recipeIngredientDao: RecipeIngredientDao(database),
  );
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => IngredientProvider(ingredientRepository)),
        ChangeNotifierProvider(create: (_) => RecipeProvider(recipeRepository)),
        ChangeNotifierProvider(
          create: (_) {
            var unitProvider = UnitOfMeasureProvider(unitOfMeasureRepository);
            unitProvider.loadRecords();
            return unitProvider;
          },
        ),
        ChangeNotifierProvider(
          create: (_) => RecipeIngredientProvider(recipeIngredientRepository),
        ),
        ChangeNotifierProvider(create: (_) => RoutesApp()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
