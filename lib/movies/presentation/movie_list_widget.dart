//import 'package:demo1/api/api_constants.dart';
//import 'package:demo1/api/fetch_functions.dart';
import 'package:demo1/main.dart';
import 'package:demo1/movies/domain/movie.dart';
import 'package:demo1/movies/presentation/movie_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../core/injector.dart';
import 'movie_details_view_model.dart';
import 'movie_view_model.dart';

// import '../../core/injector/injector.dart';

class MovieListWidget extends StatefulWidget {
  final String? title;

  const MovieListWidget({Key? key, this.title}) : super(key: key);

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final viewModel = getIt<MovieListViewModel>();
  //final movieDetailsViewModel = getIt<MovieDetailsViewModel>();
  late Stream<List<Movie>> _getMovieList;

  @override
  void initState() {
    super.initState();
    _getMovieList = viewModel.movieStream();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.title!),
            )
          ],
        ),
        SizedBox(
            width: double.infinity,
            height: 200,
            child: Observer(
              builder: (context) {
                if (viewModel.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (viewModel.error != null) {
                  return Center(
                    child: Text(viewModel.error!),
                  );
                }
                return StreamBuilder<List<Movie>>(
                    //TODO cash the images
                    stream: _getMovieList,
                    builder: (context, snapshot) {
                      final List<Movie> movies = snapshot.data ?? [];

                      return ListView.builder(
                        //to convert this to StreamBuilder
                        physics: const BouncingScrollPhysics(),
                        itemCount: movies.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return MovieWidget(movie: movies[index]);
                        },
                      );
                    });
              },
            ))
      ],
    );
  }
}

class MovieWidget extends StatefulWidget {
  const MovieWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  State<MovieWidget> createState() => _MovieWidgetState();
}

class _MovieWidgetState extends State<MovieWidget> {
  late final MovieViewModel viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = getIt<MovieViewModel>(param1: widget.movie.id);
  }

  @override
  void didUpdateWidget(covariant MovieWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('widget updated ${widget.movie}');
    if (oldWidget.movie.id != widget.movie.id) {
      print('different movie id');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          context.goNamed('movieDetail', params: <String, String>{
            'movieId': widget.movie.id.toString()
            //'movieId': '1'
          });
        },
        child: Hero(
          tag: '${widget.movie.id}${widget.movie.title}',
          child: SizedBox(
            width: 100,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                    image: NetworkImage(widget.movie.posterPath),
                    fit: BoxFit.cover,
                    //placeholder: ,
                  ),
                ),
                Observer(
                    builder: (BuildContext context) => viewModel.isFavourite
                        ? IconButton(
                            onPressed: viewModel.toggleFavourites,
                            //viewModel.isFavourite.value = false;
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ))
                        : const SizedBox()
                    //icon: const Icon(Icons.favorite),
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
