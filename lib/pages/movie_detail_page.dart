import 'package:demo1/api/endpoints.dart';
import 'package:demo1/api/fetch_functions.dart';

import 'package:flutter/material.dart';

import '../api/api_constants.dart';
import '../model/movie.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key, required this.id});

  final int id;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  Movie? selectedMovie;

  @override
  void initState() {
    super.initState();
    fetchMovie(Endpoints.movieDetailsUrl(widget.id)).then((value) {
      setState(() {
        selectedMovie = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.network('${TMDB_BASE_IMAGE_URL}w500/${selectedMovie?.posterPath}' ??
            'https://docs.flutter.dev/assets/images/docs/development/packages-and-plugins/FlutterFavoriteLogo.png'),
        Text(selectedMovie?.title ?? 'Title not fetched')
      ]),
    );
  }
}
