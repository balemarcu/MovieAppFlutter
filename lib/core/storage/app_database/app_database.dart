import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
//import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import '../../../movie_favourites/data/favourites_movies_table.dart';
import '../../../movies/data/movie_table.dart';

//import '../../movies/data/dao/movie_dao.dart';
//import '../../movies/data/api/models/movie_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [MovieTable, FavouritesMoviesTable])
// _$AppDatabase is the name of the generated class
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor queryExecutor)
      // Specify the location of the database file
      : super(queryExecutor);

  // Bump this when changing tables and columns.
  // Migrations will be covered in the next part.
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    });
  }
}


