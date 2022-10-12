import 'package:demo1/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MovieDetails extends StatelessWidget {
  MovieDetails({super.key, required this.id});

  final int id;

  late Movie selectedMovie = movies.firstWhere((element) => element.id == id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Image.network(selectedMovie.posterPath),
            Text(selectedMovie.name)

      ]),
    );
  }
}
