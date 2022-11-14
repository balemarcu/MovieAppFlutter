import 'package:demo1/movies/data/models/popular_movies_response.dart';
import 'package:demo1/movies/data/movies_repository.dart';
import 'package:demo1/movies/domain/movie.dart';
import 'package:demo1/networking/networking.dart';

import '../../main.dart';

class MoviesApi {
  //final NetworkModule networkModule = NetworkModule();
  final NetworkModule networkModule;
  //final MovieRepository repo = getIt<MovieRepository>();

  MoviesApi(this.networkModule);

  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    final response = await networkModule.dio
        .get('/movie/popular', queryParameters: {'page': page});

    //final List<Movie> result = await

    return PopularMoviesResponse.fromJson(response.data).toDomainList();
  }
}
