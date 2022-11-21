import 'package:demo1/api/endpoints.dart';
import 'package:demo1/api/fetch_functions.dart';
import 'package:demo1/movie_details/presentation/movie_details_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../api/api_constants.dart';
import '../injector/injector.dart';
//import '../model/movie.dart';
import 'package:demo1/movies/domain/movie.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key, required this.id});

  final int id;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  late final MovieDetailsViewModel viewModel;

  //late Future<Movie> selectedMovie;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<MovieDetailsViewModel>(param1: widget.id);
  }

  @override
  void didUpdateWidget(MovieDetails oldWidget) {
    if (widget.id != oldWidget.id) {
      viewModel = getIt<MovieDetailsViewModel>(param1: widget.id);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Observer(builder: (context) {
          return viewModel.selectedMovie.map(
              initial: (_) => Container(),
              loading: (_) => const Center(child: CircularProgressIndicator()),
              error: (value) => Text(value.error),
              success: (value) => Text(value.data.toString()));
        }));
  }
}
