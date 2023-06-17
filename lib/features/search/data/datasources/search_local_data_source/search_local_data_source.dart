import 'package:movies_app/features/home/data/models/movie_model.dart';

abstract class SearchLocalDataSource {
  Future<bool> cacheSearchedMovie({
    required List<MovieModel> movieModel,
  });
  // Future<bool> cacheSearchedMovie({
  //   required MovieModel movieModel,
  // });
  List<MovieModel>? getCachedSearchedMovies();
  Future<bool> deleteSearchHistory();
  Future<bool> deleteSearchMovie({
    required MovieModel movieModel,
  });
}
