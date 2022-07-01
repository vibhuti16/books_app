import 'package:books_app/src/news/pages/home_page/bloc/bloc.dart';
import 'package:books_app/src/news/pages/news_app.dart';
import 'package:books_app/src/news/pages/news_detail/bloc/bloc.dart';
import 'package:books_app/src/news/theme/bloc/bloc.dart';
import 'package:books_app/src/news/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splashscreen/splashscreen.dart';

import 'data/repository/repository.dart';
import 'navigation/bloc/bloc.dart';

class NewsMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    late ThemeData appTheme;
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
          create: (context) =>
          NewsBloc(repository: Repository())..add(Fetch(type: 'General')),
        ),
        BlocProvider<DetailBloc>(create: (context) => DetailBloc()),
        BlocProvider<NavigationBloc>(create: (context) => NavigationBloc()),
        BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is SelectedTheme) {
            appTheme = state.themeType != ThemeType.Light
                ? AppTheme.lightTheme
                : AppTheme.darkTheme;
          }
          return Builder(
            builder: (context) {
              return MaterialApp(
                title: 'Splash Screen',
                theme: appTheme,
                debugShowCheckedModeBanner: false,
                home: Splash(),
                // routes: Routes.getRoute(),
              );
            },
          );
        },
      ),
    );
  }

}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new NewsApp(),
      image: new Image.asset("assets/logos/news.png"),
      photoSize: 100.0,
    );
  }
}