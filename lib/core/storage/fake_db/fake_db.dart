import 'dart:io';
import 'dart:math';

import 'package:demo1/movie_favourites/data/favourites_movies_table.dart';
import 'package:demo1/movies/data/movie_table.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'fake_db.g.dart';

@DriftDatabase(tables: [MovieTable, FavouritesMoviesTable])
// _$AppDatabase is the name of the generated class
class AppDatabaseFake extends _$AppDatabaseFake {
  AppDatabaseFake(QueryExecutor e)
      // Specify the location of the database file
      : super(e);

  // Bump this when changing tables and columns.
  // Migrations will be covered in the next part.
  @override
  int get schemaVersion => 1;

  // @override
  // MigrationStrategy get migration {
  //   return MigrationStrategy(beforeOpen: (details) async {
  //     await customStatement('PRAGMA foreign_keys = ON');
  //   });
  // }
}

// LazyDatabase _openConnection() {
//   // // the LazyDatabase util lets us find the right location for the file async.
//   return LazyDatabase(() async {
//     // put the database file, called db.sqlite here, into the documents folder
//     // for your app.

//     //sdf
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'movies_test.sqlite'));
//     return NativeDatabase(file);
//   });
// }
