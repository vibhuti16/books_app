import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../helpers/app_constants.dart';
import '../../navigation/bloc/bloc.dart';
import '../../theme/theme.dart';
import '../../widget/custom_image.dart';
import '../home_page/bloc/bloc.dart';

class FavoritesPage extends StatefulWidget {
  final PageController? controller;
  FavoritesPage({Key? key, this.controller}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  Widget _categoryCard(String text, String type, String imgPath) {
    return InkWell(
        onTap: () {
          BlocProvider.of<NewsBloc>(context).add(Fetch(type: type));
          BlocProvider.of<NavigationBloc>(context).add(Navigate(pageIndex: 0));

          widget.controller?.animateTo(0,
              duration: Duration(milliseconds: 300), curve: Curves.linear);
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                    // height:50,
                    color: Theme.of(context).primaryColor,
                    child: CustomImage(imgPath, fit: BoxFit.cover))),
            Text(text,
                style: AppTheme.h2Style
                    .copyWith(color: Theme.of(context).colorScheme.onSurface))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Theme.of(context).bottomAppBarColor,
          title: Text(
            AppConstants.favoritesPage,
            style: AppTheme.h2Style
                .copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: GridView.count(
            padding: EdgeInsets.symmetric(vertical: 20),
            childAspectRatio: .8,
            mainAxisSpacing: 20,
            crossAxisSpacing: 0,
            crossAxisCount: 3,
            children: <Widget>[
              _categoryCard('Tech', 'technology',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSs77jFDj9CMVP5ixm7ryIB2WPbUkGRAHBclciGzQYhxq_Dz-IU'),
              //  _categoryCard('Fashion','https://thumbs.dreamstime.com/b/abstract-woman-portrait-fashion-background-hand-painted-art-illustration-56110086.jpg'),
              _categoryCard('Economy', 'business',
                  'https://st.depositphotos.com/1776223/2024/i/950/depositphotos_20243063-stock-photo-a-hand-holding-a-fan.jpg'),
              _categoryCard('Sport', 'sports',
                  'https://images.unsplash.com/photo-1521412644187-c49fa049e84d?ixlib=rb-1.2.1&w=1000&q=80'),
              _categoryCard('Health', 'health',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTaCep4PcqSpssotFl08L8j9TNlE0WrYZdP_Ej6BjW-RXArQoFO'),
              _categoryCard('Fun', 'entertainment',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTj8smVeHddjHD8AlOmvVx7CEX8t_nS81iW-UamtjKkG-q5BMi8'),
              _categoryCard('Science', 'science',
                  'https://c.wallhere.com/photos/34/7f/nature_photography_portrait_display-36961.jpg!d'),
              _categoryCard('General', 'general',
                  'https://66.media.tumblr.com/3e368d4f495ab3e07b0c7114955b48dc/tumblr_mz8od094wc1rtp2uuo1_500.jpg'),
            ],
          ),
        ));
  }
}
