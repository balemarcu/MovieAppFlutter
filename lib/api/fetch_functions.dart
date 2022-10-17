import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/movie.dart';

Future<List<Movie>> fetchMovies(String api) async {
  MovieList movieList;
  var res = await http.get(Uri.parse(api));
  var decodeRes = jsonDecode(res.body);

  movieList = MovieList.fromJson(decodeRes);
  return movieList.movies ?? [];
}

Future<Movie> fetchMovie(String api) async {
  Movie movie;

  var res = await http.get(Uri.parse(api));
  var decodeRes = jsonDecode(res.body);

  movie = Movie.fromJson(decodeRes);
  return movie;
}
