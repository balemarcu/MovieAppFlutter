import 'package:demo1/movie_favourites/data/repository/favorites_movies_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'movie_view_model.g.dart';

@injectable
class MovieViewModel extends _MovieViewModelBase with _$MovieViewModel {
  MovieViewModel(super.favouritesMoviesRepository, @factoryParam super.movieId);
}

abstract class _MovieViewModelBase with Store {
  late final FavouritesMoviesRepository _favouritesMoviesRepository;
  late final int _movieId;

  _MovieViewModelBase(this._favouritesMoviesRepository, this._movieId);

  late ObservableStream<bool> isFavouriteObs =
      _favouritesMoviesRepository.isFavorite(_movieId).asObservable();

  @computed
  bool get isFavourite => isFavouriteObs.value ?? false;

  Future<void> toggleFavourites() async {
    if (isFavourite) {
      await _favouritesMoviesRepository.removeFavourite(_movieId);
    } else {
      await _favouritesMoviesRepository.addFavouriteMovie(_movieId);
    }
  }
}
