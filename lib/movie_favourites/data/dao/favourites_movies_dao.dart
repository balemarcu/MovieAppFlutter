import 'package:demo1/core/storage/app_database/app_database.dart';
import 'package:demo1/movie_favourites/data/favourites_movies_table.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FavouritesMoviesDao {
  final AppDatabase _db;

  FavouritesMoviesDao(this._db);

  Future<int> insertFavouriteMovie(FavouritesMovie movie) {
    return _db.into(_db.favouritesMoviesTable).insert(movie.toInsertable());
  }

  Future<int> deleteFavouriteMovie(int movieId) {
    return (_db.delete(_db.favouritesMoviesTable)
          ..where((tbl) => tbl.movieId.equals(movieId)))
        .go();
  }

  Stream<bool> getFavouriteMovieById(int movieId) {
    return (_db.select(_db.favouritesMoviesTable)
          ..where((tbl) => tbl.movieId.equals(movieId)))
        .watchSingleOrNull()
        .map((event) => event != null);
  }
  //todo true or false mapping must be done here

  Stream<List<FavouritesMovie>> watchAllFavouritesMovies() {
    return _db.select(_db.favouritesMoviesTable).watch();
  }
}
