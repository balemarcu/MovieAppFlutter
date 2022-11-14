import 'package:demo1/main.dart';
import 'package:demo1/movies/data/movie_dao.dart';
import 'package:demo1/movies/data/movies_api.dart';
import 'package:demo1/movies/domain/movie.dart';
import 'package:demo1/storage_module/app_database/app_database.dart';
import 'package:drift/isolate.dart';

class MovieRepository {
  //final MoviesApi api = getIt<MoviesApi>();
  //final MovieDao mDao = getIt<MovieDao>();

  final MoviesApi api;
  final MovieDao mDao;

  MovieRepository(this.api, this.mDao);

  Future<void> getPopularMovies({int page = 1}) async {
    final List<Movie> result = await api.getPopularMovies(page: page);
    await mDao.upsertMovie(result);
    result.forEach((element) => print(element));
  }

  Stream<List<Movie>> allMovies() {
    return mDao.watchAllMovies();
  }
}
