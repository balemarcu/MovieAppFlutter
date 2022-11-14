import 'package:demo1/main.dart';
import 'package:demo1/movies/data/movies_repository.dart';
import 'package:demo1/movies/domain/movie.dart';
import 'package:mobx/mobx.dart';

part 'movies_view_model.g.dart';

class MoviesViewModel extends MoviesViewModelBase with _$MoviesViewModel {
  MoviesViewModel(final MovieRepository repository) : super(repository);
}

abstract class MoviesViewModelBase with Store {
  final MovieRepository repository;

  MoviesViewModelBase(this.repository) {
    getMovies();
  }

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @observable
  ObservableList<Movie> movies = <Movie>[].asObservable();

  @action
  Future<void> getMovies({final int page = 1}) async {
    isLoading = true;
    try {
      await Future.delayed(const Duration(seconds: 1));
      repository.getPopularMovies();
      //movies = md
    } catch (ex) {
      error = ex.toString();
    } finally {
      isLoading = false;
    }
  }

  Stream<List<Movie>> movieStream() {
    return repository.allMovies();
  }
}
