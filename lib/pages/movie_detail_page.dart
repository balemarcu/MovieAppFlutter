import 'package:demo1/api/endpoints.dart';
import 'package:demo1/api/fetch_functions.dart';
import 'package:demo1/model/movie_model_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
    // TODO: implement initState
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
        Image.network(selectedMovie!.posterPath!),
        Text(selectedMovie!.title!)
      ]),
    );
  }
}
