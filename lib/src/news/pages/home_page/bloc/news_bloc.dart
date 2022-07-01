import 'dart:async';
import 'dart:developer';
import 'package:books_app/src/news/models/newsResponseModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/repository.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final Repository? repository;

  NewsBloc({this.repository}) : super(Loading()){
    on<NewsEvent>(onLoadNews);
  }

  void onLoadNews(event, Emitter<NewsState> emitter) async{
    if (event is Fetch) {
      try {
        emit(Loading());
        final items = await repository?.fetchAllNews(category: event.type as String);
        emit(Loaded(items: items as List<Article>, type: event.type));
      } catch (error) {
        log("Error", error: error);
        emit(Failure());
      }
    }
  }
}
