import 'package:demo1/movies/data/api/models/movie_api_fake.dart';
import 'package:demo1/movies/data/dao/movie_dao.dart';
import 'package:demo1/movies/data/api/movies_api.dart';
import 'package:demo1/movie_favourites/data/dao/favourites_movies_dao.dart';
import 'package:demo1/movies/data/repository/movies_repository.dart';
import 'package:demo1/movies/domain/movie.dart';

class MovieRepositoryFake implements MovieRepository {
  final MoviesApiFake moviesApiFake;
  final MovieDao movieDao;

  //@override
  MovieRepositoryFake(this.moviesApiFake, this.movieDao);

  @override
  Stream<List<Movie>> allMovies() {
    // TODO: implement allMovies
    throw UnimplementedError();
  }

  @override
  // TODO: implement api
  MoviesApi get api => throw UnimplementedError();

  @override
  // TODO: implement fDao
  FavouritesMoviesDao get fDao => throw UnimplementedError();

  @override
  Future<Movie> getMovieDetails(int movieId) {
    // TODO: implement getMovieDetails
    throw UnimplementedError();
  }

  @override
  Future<void> getPopularMovies({int page = 1}) async {
    // TODO: implement getPopularMovies
    //throw UnimplementedError();

    final List<Movie> result_fake =
        await moviesApiFake.getPopularMovies(page: page);

    await mDao.upsertMovie(result_fake);
  }

  @override
  // TODO: implement mDao
  MovieDao get mDao => throw UnimplementedError();
}
