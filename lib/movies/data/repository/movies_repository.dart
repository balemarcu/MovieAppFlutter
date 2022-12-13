import 'package:demo1/main.dart';
import 'package:demo1/movie_favourites/data/favourites_movies_table.dart';
import 'package:demo1/movies/data/dao/movie_dao.dart';
import 'package:demo1/movies/data/api/movies_api.dart';
import 'package:demo1/movies/domain/movie.dart';
import 'package:drift/drift.dart';
//import 'package:demo1/storage_module/app_database/app_database.dart';
import 'package:drift/isolate.dart';
import 'package:injectable/injectable.dart';

import '../../../movie_favourites/data/dao/favourites_movies_dao.dart';

@lazySingleton
class MovieRepository {
  //final MoviesApi api = getIt<MoviesApi>();
  //final MovieDao mDao = getIt<MovieDao>();

  final MoviesApi api;
  final MovieDao mDao;
  //final FavouritesMoviesDao fDao;

  MovieRepository(this.api, this.mDao);

  Future<void> getPopularMovies({int page = 1}) async {
    final List<Movie> result = await api.getPopularMovies(page: page);
    await mDao.upsertMovie(result);
    //result.forEach((element) => print(element));
  }

  Stream<List<Movie>> allMovies() {
    return mDao.watchAllMovies();
  }

  Future<Movie> getMovieDetails(int movieId) => api.getMovie(movieId: movieId);
}
