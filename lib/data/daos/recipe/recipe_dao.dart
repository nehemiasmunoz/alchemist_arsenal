import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';
import 'package:drift/drift.dart';
import 'package:alchemist_arsenal/data/source/sqlite/tables/tables.dart';

part 'recipe_dao.g.dart';

@DriftAccessor(tables: [Recipe])
class RecipeDao extends DatabaseAccessor<AppDatabase> with _$RecipeDaoMixin {
  RecipeDao(super.attachedDatabase);
}
