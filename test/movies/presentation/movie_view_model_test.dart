import 'package:demo1/core/storage/app_database/app_database.dart';
import 'package:demo1/core/storage/fake_db/fake_db.dart';
import 'package:demo1/movie_favourites/data/dao/favourites_movies_dao.dart';
import 'package:demo1/movie_favourites/data/dao/favourites_movies_dao_fake.dart';
import 'package:demo1/movie_favourites/data/repository/favorites_movies_repository.dart';
import 'package:demo1/movies/data/api/models/movie_api_fake.dart';
import 'package:demo1/movies/data/dao/movie_dao.dart';
import 'package:demo1/movies/data/dao/movie_dao_fake.dart';
import 'package:demo1/movies/data/repository/movies_repository.dart';
import 'package:demo1/movies/presentation/movie_list_view_model.dart';
//import 'package:demo1/movies/data/repository/movies_repository_fake.dart';
import 'package:demo1/movies/presentation/movie_view_model.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart';

import '../../helper/async_value.dart';

void main() {
  late MovieViewModel movieViewModel;
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
  });

  setUp(() async {
    AppDatabase appDatabase = AppDatabase(NativeDatabase.memory());

    final MoviesApiFake moviesApiFake = MoviesApiFake();
    final MovieDao movieDao = MovieDao(appDatabase);
    //final MovieDao movieDaoFake = MovieDao(appDatabaseFake);

    final MovieRepository movieRepository =
        MovieRepository(moviesApiFake, movieDao);

    await movieRepository.getPopularMovies();

    //final MoviesApiFake moviesApiFake = MoviesApiFake();
    final FavouritesMoviesDao favouritesMoviesDao =
        FavouritesMoviesDao(appDatabase);

    final FavouritesMoviesRepository favouritesMoviesRepository =
        FavouritesMoviesRepository(favouritesMoviesDao);

    movieViewModel = MovieViewModel(favouritesMoviesRepository, 49046);
  });
  test('movie view model ...', () async {
    // TODO: Implement test
    // movieViewModel.toggleFavourites();

    // expect(streamOf((_) => movieViewModel.isFavourite),
    //     emitsInOrder([false, true]));

    //await Future.delayed(Duration(seconds: 1));

    //final isFav = await asyncValue((_) => movieViewModel.isFavourite);

    //expect(isFav, true);

    streamOf((_) => movieViewModel.isFavourite);

    await Future.delayed(Duration(milliseconds: 10));

    expect(movieViewModel.isFavourite, false);

    await movieViewModel.toggleFavourites();

    await Future.delayed(Duration(milliseconds: 10));

    expect(movieViewModel.isFavourite, true);
  });
}
