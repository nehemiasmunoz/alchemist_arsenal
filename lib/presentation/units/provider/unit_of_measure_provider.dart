import 'package:alchemist_arsenal/data/source/sqlite/app_database.dart';
import 'package:alchemist_arsenal/domain/repository/repositories.dart';
import 'package:flutter/material.dart';

class UnitOfMeasureProvider extends ChangeNotifier {
  late final UnitOfMeasureRepository _repository;
  List<UnitOfMeasureData> units = [];
  bool isLoading = false;

  UnitOfMeasureProvider(UnitOfMeasureRepository repository)
    : _repository = repository;

  Future<void> loadRecords() async {
    units = await _repository.getAllUnits();
    notifyListeners();
  }
}
