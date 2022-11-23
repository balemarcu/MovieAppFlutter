import 'dart:collection';

import 'package:flutter/cupertino.dart';

import 'movie_model_mock.dart';

class FavoritesModel extends ChangeNotifier {
  /// Internal, private state of the list
  final List<MovieModelMock> _favoritesMovies = [];

  UnmodifiableListView<MovieModelMock> get favoritesMovies =>
      UnmodifiableListView(_favoritesMovies);

  void add(MovieModelMock movie) {
    _favoritesMovies.add(movie);
    notifyListeners();
  }

  void removeAll() {
    _favoritesMovies.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void remove(MovieModelMock movie) {
    _favoritesMovies.remove(movie);
    notifyListeners();
  }
}
