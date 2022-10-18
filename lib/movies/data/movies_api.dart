import 'package:demo1/movies/data/models/popular_movies_response.dart';
import 'package:demo1/movies/domain/movie.dart';
import 'package:demo1/networking/networking.dart';

class MoviesApi {
  final NetworkModule networkModule = NetworkModule();

  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    final response = await networkModule.dio
        .get('/movie/popular', queryParameters: {'page': page});
    return PopularMoviesResponse.fromJson(response.data).toDomainList();
  }
}
