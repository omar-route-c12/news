import 'package:flutter/material.dart';
import 'package:news/shared/service_locator.dart';
import 'package:news/sources/data/models/source.dart';
import 'package:news/sources/data/repositories/sources_repository.dart';

class SourcesViewModel with ChangeNotifier {
  late final SourcesRepository repository;

  SourcesViewModel() {
    repository = SourcesRepository(ServiceLocator.sourcesDataSource);
  }

  List<Source> sources = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> getSources(String categoryId) async {
    isLoading = true;
    notifyListeners();
    try {
      sources = await repository.getSources(categoryId);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
