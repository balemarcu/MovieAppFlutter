import 'package:demo1/core/storage/fake_db/fake_db.dart';
import 'package:demo1/movie_favourites/data/dao/favourites_movies_dao.dart';
import 'package:demo1/movie_favourites/domain/movie_details.dart';

class FavouritesMoviesDaoFake implements FavouritesMoviesDao {
  final AppDatabaseFake _db;

  FavouritesMoviesDaoFake(this._db);

  @override
  Future<int> deleteFavouriteMovie(int movieId) {
    // TODO: implement deleteFavouriteMovie
    //throw UnimplementedError();
    return (_db.delete(_db.favouritesMoviesTable)
          ..where((tbl) => tbl.movieId.equals(movieId)))
        .go();
  }

  @override
  Stream<bool> getFavouriteMovieById(int movieId) {
    // TODO: implement getFavouriteMovieById
    //throw UnimplementedError();
    return (_db.select(_db.favouritesMoviesTable)
          ..where((tbl) => tbl.movieId.equals(movieId)))
        .watchSingleOrNull()
        .map((event) => event != null);
  }

  @override
  Future<int> insertFavouriteMovie(FavouritesMovie movie) {
    // TODO: implement insertFavouriteMovie
    //throw UnimplementedError();
    return _db.into(_db.favouritesMoviesTable).insert(movie.toInsertable());
  }

  @override
  Stream<List<FavouritesMovie>> watchAllFavouritesMovies() {
    // TODO: implement watchAllFavouritesMovies
    //throw UnimplementedError();
    return _db.select(_db.favouritesMoviesTable).watch();
  }
}
