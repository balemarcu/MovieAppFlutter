import 'package:demo1/core/storage/app_database/app_database.dart';
import 'package:demo1/core/storage/fake_db/fake_db.dart';
import 'package:demo1/core/storage/fake_storage_module.dart';
import 'package:demo1/core/storage/storage_module.dart';
import 'package:demo1/movies/data/api/models/movie_api_fake.dart';
import 'package:demo1/movies/data/dao/movie_dao.dart';
import 'package:demo1/movies/data/dao/movie_dao_fake.dart';
import 'package:demo1/movies/data/repository/movies_repository.dart';
//import 'package:demo1/movies/data/repository/movies_repository_fake.dart';
import 'package:demo1/movies/domain/movie.dart';
import 'package:demo1/movies/presentation/movie_list_view_model.dart';
import 'package:demo1/movies/presentation/movie_view_model.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helper/async_value.dart';

//class MockRepository implements MovieRepository

void main() {
  late MovieListViewModel movieListViewModel;

  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
  });

  setUp(() {
    AppDatabase appDatabase = FakeStorageModule().db;

    final MoviesApiFake moviesApiFake = MoviesApiFake();
    final MovieDao movieDao = MovieDao(appDatabase);
    //final MovieDao movieDaoFake = MovieDao(appDatabaseFake);

    final MovieRepository movieRepository =
        MovieRepository(moviesApiFake, movieDao);

    movieListViewModel = MovieListViewModel(movieRepository);
  });

  test('testing the creation of the movie view model', () async {
    //viewModelTestSetUp();

    expect(movieListViewModel.isLoading, true);
    //expect(asyncValue((_) => vi), matcher)

    // movieListViewModel.movieStream().forEach((element) {
    //   print(element);
    // });
    // await Future.delayed(const Duration(seconds: 10));

    expect(
        movieListViewModel.movieStream(),
        emitsInOrder([
          [],
          [
            Movie(
                id: 49046,
                title: 'All Quiet on the Western Front',
                overview:
                    'Paul Baumer and his friends Albert and Muller, egged on by romantic dreams of heroism, voluntarily enlist in the German army. Full of excitement and patriotic fervour, the boys enthusiastically march into a war they believe in. But once on the Western Front, they discover the soul-destroying horror of World War I.',
                posterPath:
                    'https://image.tmdb.org/t/p/w500https://image.tmdb.org/t/p/w500/hYqOjJ7Gh1fbqXrxlIao1g8ZehF.jpg',
                releaseDate: '2022-10-07')
          ]
        ]));
  });
}
