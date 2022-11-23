import 'package:mobx/mobx.dart';

import 'model/movie_model_mock.dart';

//import '../model/movie_model_mock.dart';

//include generated file
part 'favourite_movies_store.g.dart';

// This is the class used by rest of your codebase
class FavouriteMoviesStore = _FavouriteMoviesStore with _$FavouriteMoviesStore;

//the store class
abstract class _FavouriteMoviesStore with Store {
  @observable
  ObservableList<MovieModelMock> favoriteMovies =
      <MovieModelMock>[].asObservable();

  @action
  void add(MovieModelMock movie) {
    favoriteMovies.add(movie);
  }

  @action
  void removeAll() {
    favoriteMovies.clear();
  }

  @action
  void remove(MovieModelMock movie) {
    favoriteMovies.remove(movie);
  }
}
