import 'package:demo1/movies/domain/movie.dart';
import 'package:drift/drift.dart';
export 'package:demo1/movies/domain/movie.dart';

@UseRowClass(Movie, generateInsertable: true)
class MovieTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get overview => text()();
  TextColumn get posterPath => text()();
  TextColumn get releaseDate => text()();
}
