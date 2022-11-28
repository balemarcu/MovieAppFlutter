import 'package:demo1/movie_favourites/data/repository/favorites_movies_repository.dart';
import 'package:demo1/movies/data/repository/movies_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../core/resource.dart';
import '../domain/movie.dart';

part 'movie_details_view_model.g.dart';

@injectable
class MovieDetailsViewModel extends _MovieDetailsViewModelBase
    with _$MovieDetailsViewModel {
  MovieDetailsViewModel(super.movieRepository, super.favouritesMoviesRepository,
      @factoryParam super.movieId);
}

abstract class _MovieDetailsViewModelBase with Store {
  late final MovieRepository _movieRepository;
  late final FavouritesMoviesRepository _favouritesMoviesRepository;
  late final int _movieId;

  _MovieDetailsViewModelBase(
      this._movieRepository, this._favouritesMoviesRepository, this._movieId) {
    getMovieDetails(_movieId);
  }

  @observable
  Resource<Movie> selectedMovie = const Resource.initial();

  late ObservableStream<bool> isFavouriteObs =
      _favouritesMoviesRepository.isFavorite(_movieId).asObservable();

  @computed
  bool get isFavourite => isFavouriteObs.value ?? false;

  @action
  Future<void> getMovieDetails(int id) async {
    selectedMovie = const Resource.loading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      selectedMovie =
          Resource.success(data: (await _movieRepository.getMovieDetails(id)));
      //isFavourite = _movieRepository.
    } catch (ex) {
      selectedMovie = Resource.error(error: ex.toString());
    }
  }

  Future<void> toggleFavourites() async {
    if (isFavourite) {
      await _favouritesMoviesRepository.removeFavourite(_movieId);
    } else {
      await _favouritesMoviesRepository.addFavouriteMovie(_movieId);
    }
  }
}
