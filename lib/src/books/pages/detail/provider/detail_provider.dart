import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../books/helpers/app_contants.dart';
import '../../../models/book_model.dart';

class DetailProvider  {

  static String? bookUrl;

  Future<BookModel?> getBookDetail(String? id) async {
    try {
      final response = await http
          .get(Uri.parse(AppConstants.baseUrl+"/$id"));
      return BookModel.fromApi(jsonDecode(response.body));
    } catch (e) {
      print("error get book detail $e");
      return null;
    }
  }
}
