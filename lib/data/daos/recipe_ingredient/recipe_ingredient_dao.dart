import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';
import 'package:alchemist_arsenal/data/source/sqlite/tables/tables.dart';
import 'package:drift/drift.dart';

part 'recipe_ingredient_dao.g.dart';

@DriftAccessor(tables: [RecipeIngredient])
class RecipeIngredientDao extends DatabaseAccessor<AppDatabase>
    with _$RecipeIngredientDaoMixin {
  RecipeIngredientDao(super.attachedDatabase);
}

//
