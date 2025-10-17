import 'package:alchemist_arsenal/data/daos/units/unit_of_measure_dao.dart';
import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';

class UnitOfMeasureRepository {
  final UnitOfMeasureDao _unitOfMeasureDao;
  UnitOfMeasureRepository(this._unitOfMeasureDao);

  Future<List<UnitOfMeasureData>> getAllUnits() async {
    return await _unitOfMeasureDao.getAllUnits();
  }
}
