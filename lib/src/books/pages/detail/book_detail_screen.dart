
import 'package:books_app/src/books/pages/detail/provider/detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/book_model.dart';
import '../home/home_screen.dart';
import '../home/provider/home_provider.dart';

class BookDetailScreen extends StatelessWidget {
  BookDetailScreen({this.bookId});

  final String? bookId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Detail"),
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            if (_isBookListNotEmpty(context)) {
              Navigator.pop(context);
            } else {
              // context.pushRoute(HomeScreen());
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  HomeScreen()),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: _bottomNavWidget(),
      body: FutureBuilder<BookModel?>(
        future: DetailProvider().getBookDetail(this.bookId),
        builder: (context, apiResponse) {
          final bookModel = apiResponse.data;
          DetailProvider.bookUrl = bookModel?.bookUrl;

          if (apiResponse.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (apiResponse.connectionState == ConnectionState.done &&
              bookModel == null) {
            return Center(
              child: Text(
                "Data not found",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    decoration: TextDecoration.none),
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Text(
                    "${bookModel?.title}",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Text(
                    "${bookModel?.subtitle ?? "-"}",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Image.network(bookModel?.thumbnail ?? "")),
                Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Text(bookModel?.description ?? "-")),
              ],
            ),
          );
        },
      ),
    );
  }

  bool _isBookListNotEmpty(BuildContext context) {
    return Provider.of<HomeProvider>(context, listen: false).books.isNotEmpty;
  }

  Widget _bottomNavWidget() {
    final widget = Container(
      color: Colors.blue,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "Buy Book",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
    return InkWell(
      child: widget,
      onTap: () async {
        final _url = DetailProvider.bookUrl;
        if (_url != null) {
          // if (!await launch(_url)) throw 'Could not launch $_url';
        }
      },
    );
  }
}
