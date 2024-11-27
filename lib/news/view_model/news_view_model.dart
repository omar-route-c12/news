import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/data/repositories/news_repository.dart';
import 'package:news/news/view_model/news_states.dart';
import 'package:news/shared/service_locator.dart';

class NewsViewModel extends Cubit<NewsState> {
  late final NewsRepository repository;

  NewsViewModel() : super(NewsInitial()) {
    repository = NewsRepository(ServiceLocator.newsDataSource);
  }

  Future<void> getNews(String sourceId) async {
    emit(GetNewsLoading());
    try {
      final newsList = await repository.getNews(sourceId);
      emit(GetNewsSuccess(newsList));
    } catch (error) {
      emit(GetNewsError(error.toString()));
    }
  }
}
