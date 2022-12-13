import 'package:demo1/core/resource.dart';
import 'package:demo1/main.dart';
import 'package:demo1/movies/data/repository/movies_repository.dart';
import 'package:demo1/movies/domain/movie.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'movie_list_view_model.g.dart';

@injectable
class MovieListViewModel extends MovieListViewModelBase
    with _$MovieListViewModel {
  MovieListViewModel(final MovieRepository repository) : super(repository);
}

abstract class MovieListViewModelBase with Store {
  final MovieRepository repository;

  MovieListViewModelBase(this.repository) {
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

  //--------
  // @observable
  // Resource<List<Movie>> movies = const Resource.initial();

  // late ObservableStream<List<Movie>> movieObs =
  //     repository.allMovies().asObservable();

  // @computed
  // Resource<List<Movie>> get allMovies {
  //   final movies = movieObs.value;

  //   if (movies == null) {
  //     return Resource.initial();
  //   }

  //   // final data = movies.map((movie) {
  //   //   final bool 
  //   // }).toList();

  //   // if (req)

  //   //return Resource.success(data: data)
  // }
}
