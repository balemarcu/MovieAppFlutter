import 'package:demo1/movies/domain/movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

//import '../../../api/api_constants.dart';

part 'popular_movies_response.freezed.dart';
part 'popular_movies_response.g.dart';

@freezed
class PopularMoviesResponse with _$PopularMoviesResponse {
  const PopularMoviesResponse._();

  const factory PopularMoviesResponse({
    required int page,
    @JsonKey(name: 'total_pages') required int totalPages,
    @JsonKey(name: 'total_results') required int totalResults,
    required List<MovieResponse> results,
  }) = _PopularMoviesResponse;

  factory PopularMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularMoviesResponseFromJson(json);

  List<Movie> toDomainList() {
    return results.map((e) => e.toDomain()).toList();
  }
}

@freezed
class MovieResponse with _$MovieResponse {
  const MovieResponse._();
  const factory MovieResponse({
    required int id,
    required String title,
    required String overview,
    @JsonKey(name: 'poster_path') required String posterPath,
    @JsonKey(name: 'release_date') required String releaseDate,
  }) = _MovieResponse;

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);

  Movie toDomain() {
    return Movie(
        id: id,
        title: title,
        overview: overview,
        posterPath: '${'https://image.tmdb.org/t/p/'}w500$posterPath',
        releaseDate: releaseDate);
  }
}
