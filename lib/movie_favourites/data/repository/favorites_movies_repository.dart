import 'package:demo1/movie_favourites/data/dao/favourites_movies_dao.dart';
import 'package:injectable/injectable.dart';

import '../../domain/movie_details.dart';

@lazySingleton
class FavouritesMoviesRepository {
  final FavouritesMoviesDao fDao;

  FavouritesMoviesRepository(this.fDao);

  Future<void> addFavouriteMovie(int movieId) async {
    await fDao.insertFavouriteMovie(FavouritesMovie(
      movieId: movieId,
    ));
  }

  Future<void> removeFavourite(int movieId) async {
    await fDao.deleteFavouriteMovie(movieId);
  }

  Stream<List<FavouritesMovie>> watchFavouritesMovies() {
    return fDao.watchAllFavouritesMovies();
  }

  Stream<bool> isFavorite(int movieId) {
    return fDao.getFavouriteMovieById(movieId);
  }
}
