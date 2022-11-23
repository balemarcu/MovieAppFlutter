import 'package:demo1/core/storage/app_database/app_database.dart';
import 'package:demo1/movie_details/data/favourites_movies_table.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FavouritesMoviesDao {
  final AppDatabase _db;

  FavouritesMoviesDao(this._db);

  Future<int> insertFavouriteMovie(MovieDetails movie) {
    // await _db
    //     .into(_db.favouritesMoviesTable)
    //     .insertOnConflictUpdate(movie.toInsertable());

    return _db.into(_db.favouritesMoviesTable).insert(movie.toInsertable());
  }
}
