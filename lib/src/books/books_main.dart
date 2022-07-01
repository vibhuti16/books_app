import 'package:books_app/src/books/pages/home/home_screen.dart';
import 'package:books_app/src/books/pages/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

class BooksMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeProvider()),
        ],
          child : Builder(
            builder: (context) {
              return MaterialApp(
                title: 'Splash Screen',
                debugShowCheckedModeBanner: false,
                home: Splash(),
                // routes: Routes.getRoute(),
              );
            },
          ));
        }
    //   ),
    // );
  }

// }

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new HomeScreen(),
      image: new Image.asset("assets/logos/books.png"),
      photoSize: 100.0,
    );
  }
}