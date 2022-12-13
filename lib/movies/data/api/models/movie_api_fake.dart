import 'dart:convert';

import 'package:demo1/movies/data/api/models/popular_movies_response.dart';
import 'package:demo1/movies/data/api/movies_api.dart';
import 'package:dio/src/dio.dart';
import 'package:demo1/movies/domain/movie.dart';
//import 'package:demo1/core/storage/fake_db/movies_db.json';
import 'package:flutter/services.dart';

class MoviesApiFake implements MoviesApi {
  @override
  Future<Movie> getMovie({required int movieId}) {
    // TODO: implement getMovie
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    // TODO: implement getPopularMovies
    //throw UnimplementedError();
    final response = await rootBundle.loadString('assets/movies_db.json');
    final data = await jsonDecode(response);
    //print(data);
    return PopularMoviesResponse.fromJson(data).toDomainList();
  }

  @override
  // TODO: implement dio
  Dio get dio => throw UnimplementedError();
}
