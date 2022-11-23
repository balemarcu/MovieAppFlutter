import 'package:demo1/movies/data/repository/movies_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../core/resource.dart';
import '../../movies/domain/movie.dart';

part 'movie_details_view_model.g.dart';

@injectable
class MovieDetailsViewModel extends _MovieDetailsViewModelBase
    with _$MovieDetailsViewModel {
  MovieDetailsViewModel(super.movieRepository, @factoryParam super.movieId);
}

abstract class _MovieDetailsViewModelBase with Store {
  late final MovieRepository _movieRepository;
  late final int _movieId;

  _MovieDetailsViewModelBase(this._movieRepository, this._movieId) {
    getMovieDetails(_movieId);
  }

  @observable
  Resource<Movie> selectedMovie = const Resource.initial();

  @action
  Future<void> getMovieDetails(int id) async {
    selectedMovie = const Resource.loading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      selectedMovie =
          Resource.success(data: (await _movieRepository.getMovieDetails(id)));
    } catch (ex) {
      selectedMovie = Resource.error(error: ex.toString());
    }
  }

  Future<void> addToFavourites(Movie movie) async {
    await _movieRepository.addFavouriteMovie(movie.id, movie.title);
  }
}
