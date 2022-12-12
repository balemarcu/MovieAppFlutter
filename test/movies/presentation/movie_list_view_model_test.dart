import 'package:demo1/core/storage/fake_db/fake_db.dart';
import 'package:demo1/movies/data/api/models/movie_api_fake.dart';
import 'package:demo1/movies/data/dao/movie_dao.dart';
import 'package:demo1/movies/data/dao/movie_dao_fake.dart';
import 'package:demo1/movies/data/repository/movies_repository.dart';
import 'package:demo1/movies/data/repository/movies_repository_fake.dart';
import 'package:demo1/movies/presentation/movie_list_view_model.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

//class MockRepository implements MovieRepository

void main() {
  late MovieListViewModel movieListViewModel;

  setUp(() {
    // movieListViewModel = MovieListViewModel(repository)
  });

  Future<void> viewModelTestSetUp() async {
    AppDatabaseFake appDatabaseFake = AppDatabaseFake(NativeDatabase.memory());

    final MoviesApiFake moviesApiFake = MoviesApiFake();
    final MovieDaoFake movieDaoFake = MovieDaoFake(appDatabaseFake);

    final MovieRepositoryFake movieRepositoryFake =
        MovieRepositoryFake(moviesApiFake, movieDaoFake);

    final MovieListViewModel movieListViewModel =
        MovieListViewModel(movieRepositoryFake);
  }
  // group('testing movies view_model', () {
  //   test('view model', () {

  //   });
  // });
}
