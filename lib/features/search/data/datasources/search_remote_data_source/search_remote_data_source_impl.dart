import 'package:movies_app/core/api/api_consumer.dart';
import 'package:movies_app/core/api/api_end_points.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/movie_details/data/models/movie_details_model/genre_model.dart';

import 'search_remote_data_source.dart';

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final ApiConsumer apiConsumer;

  SearchRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<List<MovieModel>> searchMovies({required String? query}) async {
    final response = await apiConsumer.get(
      ApiEndPoints.searchMovies,
      queryParameters: {
        'query': query,
      },
    );
    final searchMoviesList = response['results'] as List;
    return List<MovieModel>.from((searchMoviesList)
        .map((searchItem) => MovieModel.fromJson(searchItem)));
  }

  @override
  Future<List<GenreModel>> getAllGenres() async {
    final response = await apiConsumer.get(
      ApiEndPoints.allMoviesGenres,
    );
    final allMoviesGenres = response['genres'] as List;
    return List<GenreModel>.from((allMoviesGenres)
        .map((currentGenre) => GenreModel.fromJson(currentGenre)));
  }
}
