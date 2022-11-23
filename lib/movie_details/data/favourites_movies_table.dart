import 'package:demo1/movie_details/domain/movie_details.dart';
import 'package:demo1/movies/data/movie_table.dart';
import 'package:drift/drift.dart';

export 'package:demo1/movie_details/domain/movie_details.dart';

@UseRowClass(MovieDetails, generateInsertable: true)
class FavouritesMoviesTable extends Table {
  //IntColumn get favourite_id => integer().autoIncrement()();
  IntColumn get movieId => integer().references(MovieTable, #id)();
  TextColumn get title => text()();

  // @override
  // Set<Column> get primaryKey => {movieId};
}
