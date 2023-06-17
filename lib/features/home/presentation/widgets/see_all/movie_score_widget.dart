import 'package:flutter/material.dart';

class MovieScoreWidget extends StatelessWidget {
  const MovieScoreWidget({super.key, required this.voteCount});
  final int voteCount;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: _determineMovieScoreColor(voteCount).backgroundColor,
      ),
      child: Text(
        '$voteCount',
        style: TextStyle(
          color: _determineMovieScoreColor(voteCount).textColor,
        ),
      ),
    );
  }

  MovieScoreBackgroundColorAndTextColor _determineMovieScoreColor(
      int voteCount) {
    if (voteCount > 1000) {
      return MovieScoreBackgroundColorAndTextColor.green;
    } else if (voteCount > 200) {
      return MovieScoreBackgroundColorAndTextColor.yellow;
    }
    return MovieScoreBackgroundColorAndTextColor.red;
  }
}

enum MovieScoreBackgroundColorAndTextColor {
  green(Colors.green, Colors.white),
  yellow(Colors.yellow, Colors.black),
  red(Colors.redAccent, Colors.black);

  const MovieScoreBackgroundColorAndTextColor(
    this.backgroundColor,
    this.textColor,
  );
  final Color backgroundColor;
  final Color textColor;
}
