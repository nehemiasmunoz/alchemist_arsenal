import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';
import 'package:alchemist_arsenal/data/source/sqlite/tables/tables.dart';
import 'package:drift/drift.dart';

part 'unit_of_measure_dao.g.dart';

@DriftAccessor(tables: [UnitOfMeasure])
class UnitOfMeasureDao extends DatabaseAccessor<AppDatabase>
    with _$UnitOfMeasureDaoMixin {
  UnitOfMeasureDao(super.attachedDatabase);

  Future<List<UnitOfMeasureData>> getAllUnits() async {
    return await select(unitOfMeasure).get();
  }
}
