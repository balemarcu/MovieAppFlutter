import 'package:flutter/material.dart';

class Movie {
  final int id;
  final String name, posterPath;

  Movie({required this.id, required this.name, required this.posterPath});
}

List<Movie> movies = [
  Movie(
      id: 1,
      name: 'Movie 1',
      posterPath:
          'https://www.indiewire.com/wp-content/uploads/2019/12/ad-astra.jpg?w=500'),
  Movie(
      id: 2,
      name: 'Movie 2',
      posterPath:
          'https://www.indiewire.com/wp-content/uploads/2019/12/beach_bum.jpg?w=510'),
  Movie(
      id: 3,
      name: 'Movie 3',
      posterPath:
          'https://www.indiewire.com/wp-content/uploads/2019/12/dark-phoenix.jpg?w=856'),
];

//"https://www.indiewire.com/wp-content/uploads/2019/12/dark-phoenix.jpg?w=856"