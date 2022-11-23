import 'package:demo1/movies/domain/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetailsWidget extends StatelessWidget {
  final Movie movie;
  const MovieDetailsWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Card(
              child: Container(
            height: 450,
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(movie.posterPath),
                )),
          )),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          movie.title,
          style: const TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
