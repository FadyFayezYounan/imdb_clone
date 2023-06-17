import 'package:movies_app/features/movie_details/data/models/movie_details_model/genre_model.dart';

import '../../../../home/data/models/movie_model.dart';

abstract class SearchRemoteDataSource {
  Future<List<MovieModel>> searchMovies({required String? query});
  Future<List<GenreModel>> getAllGenres();
}
