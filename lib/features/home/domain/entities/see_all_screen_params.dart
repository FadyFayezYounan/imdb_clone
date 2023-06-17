import 'movie_entity.dart';

class SeeAllScreenParams {
  final String pageTitle;
  final Future<List<MovieEntity>> Function(int page) getMoviesFunc;

  SeeAllScreenParams({
    required this.pageTitle,
    required this.getMoviesFunc,
  });
}
