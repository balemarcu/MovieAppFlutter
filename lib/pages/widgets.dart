import 'package:demo1/api/api_constants.dart';
import 'package:demo1/api/fetch_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

import '../model/movie.dart';

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
        moviesList = value;
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
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  physics: BouncingScrollPhysics(),
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
                                  child: FadeInImage(
                                    image: NetworkImage(
                                        '${TMDB_BASE_IMAGE_URL}w500/${moviesList![index].posterPath!}'),
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
                ),
        )
      ],
    );
  }
}
