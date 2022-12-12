import 'package:demo1/movies/domain/movie.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('movie ...', () {
    var movie = Movie(
        id: 1,
        title: 'Movie 1',
        overview: 'Overview 1',
        posterPath: 'PosterPath 1',
        releaseDate: '23.07.2000');

    test('Testing movie fields', () {
      expect(movie.id, 1);
      expect(movie.title, 'Movie 1');
      expect(movie.overview, 'Overview 1');
    });

    
  });
}
