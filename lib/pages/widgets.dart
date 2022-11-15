import 'package:demo1/api/api_constants.dart';
import 'package:demo1/api/fetch_functions.dart';
import 'package:demo1/main.dart';
import 'package:demo1/movies/domain/movie.dart';
import 'package:demo1/movies/presentation/movies_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../injector/injector.dart';

class ScrollingMovies extends StatefulWidget {
  final String? api, title;

  const ScrollingMovies({super.key, this.api, this.title});

  @override
  State<ScrollingMovies> createState() => _ScrollingMoviesState();
}

class _ScrollingMoviesState extends State<ScrollingMovies> {
  List<Movie>? moviesList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchMovies(widget.api!).then((value) {
      setState(() {
        moviesList = value.cast<Movie>();
      });
    });
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
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          height: 200,
          child: moviesList == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: moviesList!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          context
                              .goNamed('movieDetail', params: <String, String>{
                            'movieId':
                                moviesList!.elementAt(index).id.toString()
                            //'movieId': '1'
                          });
                        },
                        child: Hero(
                          tag: '${moviesList![index].id}${widget.title}',
                          child: SizedBox(
                            width: 100,
                            child: Column(
                              children: [
                                Expanded(
                                    child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        '${TMDB_BASE_IMAGE_URL}w500/${moviesList![index].posterPath}',
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                    fit: BoxFit.cover,
                                  ),
                                  // FadeInImage(
                                  //   image: NetworkImage(
                                  //       '${TMDB_BASE_IMAGE_URL}w500/${moviesList![index].posterPath!}'),
                                  //   fit: BoxFit.cover,
                                  //   placeholder: AssetImage(
                                  //       'lib/icons/loading_gif/spinner_200px_transparent.gif'),
                                  // ),
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
        )
      ],
    );
  }
}

class ScrollingMoviesDio extends StatefulWidget {
  final String? title;

  const ScrollingMoviesDio({Key? key, this.title}) : super(key: key);

  @override
  State<ScrollingMoviesDio> createState() => _ScrollingMoviesDioState();
}

class _ScrollingMoviesDioState extends State<ScrollingMoviesDio> {
  final viewModel = getIt<MoviesViewModel>();
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
                      final List<Movie>? movies = snapshot.data;
                      return ListView.builder(
                        //to convert this to StreamBuilder
                        physics: const BouncingScrollPhysics(),
                        itemCount: movies?.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                context.goNamed('movieDetail',
                                    params: <String, String>{
                                      'movieId':
                                          movies.elementAt(index).id.toString()
                                      //'movieId': '1'
                                    });
                              },
                              child: Hero(
                                tag: '${movies?[index].id}${widget.title}',
                                child: SizedBox(
                                  width: 100,
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: FadeInImage(
                                          image: NetworkImage(
                                              movies![index].posterPath),
                                          fit: BoxFit.cover,
                                          placeholder: AssetImage(
                                              'lib/icons/loading_gif/spinner_200px_transparent.gif'),
                                        ),
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    });
              },
            ))
      ],
    );
  }
}
