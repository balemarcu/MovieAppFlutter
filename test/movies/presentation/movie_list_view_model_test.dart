import 'package:demo1/core/storage/fake_db/fake_db.dart';
import 'package:demo1/movies/data/api/models/movie_api_fake.dart';
import 'package:demo1/movies/data/dao/movie_dao.dart';
import 'package:demo1/movies/data/dao/movie_dao_fake.dart';
import 'package:demo1/movies/data/repository/movies_repository.dart';
import 'package:demo1/movies/data/repository/movies_repository_fake.dart';
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

  setUp(() {
    // movieListViewModel = MovieListViewModel(repository)
  });

  WidgetsFlutterBinding.ensureInitialized();

  Future<void> viewModelTestSetUp() async {
    AppDatabaseFake appDatabaseFake = AppDatabaseFake(NativeDatabase.memory());

    final MoviesApiFake moviesApiFake = MoviesApiFake();
    final MovieDaoFake movieDaoFake = MovieDaoFake(appDatabaseFake);
    //final MovieDao movieDaoFake = MovieDao(appDatabaseFake);

    final MovieRepositoryFake movieRepositoryFake =
        MovieRepositoryFake(moviesApiFake, movieDaoFake);

    final MovieListViewModel movieListViewModel =
        MovieListViewModel(movieRepositoryFake);

    //moviesApiFake.getPopularMovies();
    expect(movieListViewModel.isLoading, true);
    //expect(asyncValue((_) => vi), matcher)

    //print(movieListViewModel.movieStream().first);
    //expect(movieListViewModel.movieStream().first, matcher)
    // test('testing if movie exists', () {
    //   List<Movie> movies =
    //       movieListViewModel.movieStream().toList() as List<Movie>;

    //   expect(movies[0].id, '49046');
    // });

    // List<Movie> movies =
    //     movieListViewModel.movieStream().toList() as List<Movie>;

    // expect(movies[0].id, '49046');
  }

  test('testing the creation of the movie view model', () {
    viewModelTestSetUp();
  });
}
