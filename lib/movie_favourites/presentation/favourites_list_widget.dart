import 'package:demo1/movie_favourites/data/favourites_movies_table.dart';
import 'package:flutter/material.dart';

class FavouritesMoviesList extends StatefulWidget {
  const FavouritesMoviesList({Key? key}) : super(key: key);

  @override
  State<FavouritesMoviesList> createState() => _FavouritesMoviesListState();
}

class _FavouritesMoviesListState extends State<FavouritesMoviesList> {
  @override
  Widget build(BuildContext context) {
    return Column(
        // FutureBuilder(builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        //   if (snapshot.hasData) {
        //     return ListView.builder(itemBuilder: itemBuilder)
        //   }
        // },)
        );
  }
}
