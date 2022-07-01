import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../../../../books/helpers/app_contants.dart';
import '../../../models/book_model.dart';

class HomeProvider with ChangeNotifier {
  List<BookModel> books = [];
  int page = 0;
  bool isLoading = true;
  String? query = "cancer";

  Future<void> getBooks() async {
    try {
      final response = await http.get(Uri.parse(
          AppConstants.baseUrl+"?q=$query&startIndex=$page&maxResults=40"));

      //print("response.body ${response.body}");
      final items = jsonDecode(response.body)['items'];
      List<BookModel> bookList = [];
      for (var item in items) {
        bookList.add(BookModel.fromApi(item));
      }

      books.addAll(bookList);
      page += 40;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print("error get books $e");
    }
  }

  void showLoading() {
    isLoading = true;
    notifyListeners();
  }
}
