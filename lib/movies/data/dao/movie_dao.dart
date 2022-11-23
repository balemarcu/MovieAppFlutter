//import 'package:demo1/storage_module/app_database/app_database.dart';

import 'package:injectable/injectable.dart';

import '../../../core/storage/app_database/app_database.dart';
import '../../domain/movie.dart';

@lazySingleton
class MovieDao {
  final AppDatabase _db;

  MovieDao(this._db);

  Stream<List<Movie>> watchAllMovies() {
    return _db.select(_db.movieTable).watch();
  }

  Future<List<Movie>> getAllMovies() {
    return _db.select(_db.movieTable).get();
  }

  //TODO CRUD operations

  Future<void> replaceAll(final List<Movie> movies) async {
    await deleteAllMovies();
    await upsertMovie(movies);
  }

  Future<void> upsertMovie(final List<Movie> movies) async {
    for (final movie in movies) {
      await _db
          .into(_db.movieTable)
          .insertOnConflictUpdate(movie.toInsertable());
    }
  }

  Future deleteAllMovies() {
    return _db.delete(_db.movieTable).go();
  }
}
