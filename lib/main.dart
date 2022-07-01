import 'package:books_app/src/books/books_main.dart';
import 'package:books_app/src/news/news_main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) =>  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ ElevatedButton(
            child: Text("News"),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  NewsMain()),
            ),
          ),
        ElevatedButton(
              child: Text("Books"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  BooksMain()),
              ),
            ),
          ],)
      ),
    );
  }
}


