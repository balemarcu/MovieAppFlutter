import 'package:demo1/movies/data/models/popular_movies_response.dart';
import 'package:demo1/movies/data/movies_repository.dart';
import 'package:demo1/movies/domain/movie.dart';
import 'package:demo1/networking/networking.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../main.dart';

@lazySingleton
class MoviesApi {
  //final NetworkModule networkModule = NetworkModule();
  //final NetworkModule networkModule;
  //final MovieRepository repo = getIt<MovieRepository>();
  final Dio dio;

  MoviesApi(this.dio);

  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    final response =
        await dio.get('/movie/popular', queryParameters: {'page': page});

    //final List<Movie> result = await

    return PopularMoviesResponse.fromJson(response.data).toDomainList();
  }

  Future<Movie> getMovie({required int movieId}) async {
    final response = await dio.get('/movie/$movieId');

    return MovieResponse.fromJson(response.data).toDomain();
  }
}
