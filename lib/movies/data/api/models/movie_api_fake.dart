import 'dart:convert';

import 'package:demo1/movies/data/api/models/popular_movies_response.dart';
import 'package:demo1/movies/data/api/movies_api.dart';
import 'package:dio/src/dio.dart';
import 'package:demo1/movies/domain/movie.dart';
import 'package:demo1/core/storage/fake_db/movies_db.json';

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
    final data = await jsonDecode('movies_db.json');
    print(data);
    return PopularMoviesResponse.fromJson(json.decode(data)).toDomainList();
  }

  @override
  // TODO: implement dio
  Dio get dio => throw UnimplementedError();
}
