import 'package:demo1/core/storage/fake_db/fake_db.dart';
import 'package:demo1/movie_favourites/data/dao/favourites_movies_dao.dart';
import 'package:demo1/movie_favourites/data/dao/favourites_movies_dao_fake.dart';
import 'package:demo1/movie_favourites/data/repository/favorites_movies_repository.dart';
import 'package:demo1/movies/data/api/models/movie_api_fake.dart';
import 'package:demo1/movies/data/dao/movie_dao_fake.dart';
import 'package:demo1/movies/data/repository/movies_repository_fake.dart';
import 'package:demo1/movies/presentation/movie_view_model.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('movie view model ...', (tester) async {
    // TODO: Implement test
    AppDatabaseFake appDatabaseFake = AppDatabaseFake(NativeDatabase.memory());

    //final MoviesApiFake moviesApiFake = MoviesApiFake();
    final FavouritesMoviesDaoFake favouritesMoviesDaoFake =
        FavouritesMoviesDaoFake(appDatabaseFake);

    final FavouritesMoviesRepository favouritesMoviesRepository =
        FavouritesMoviesRepository(favouritesMoviesDaoFake);

    final MovieViewModel movieViewModel =
        MovieViewModel(favouritesMoviesRepository, 49046);

    expect(movieViewModel.isFavourite, false);

    movieViewModel.toggleFavourites();

    //expect(movieViewModel.isFavourite, true);
  });
}
