import 'package:movies_app/features/home/data/models/movie_model.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/api_end_points.dart';
import 'home_remote_data_source.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiConsumer apiConsumer;

  HomeRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<List<MovieModel>> getPopularMovies({required int page}) async {
    final response =
        await apiConsumer.get(ApiEndPoints.popularMovies, queryParameters: {
      'page': page,
    });
    final popularMoviesList = response['results'] as List;
    return List<MovieModel>.from(
        (popularMoviesList).map((e) => MovieModel.fromJson(e)));
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies({required int page}) async {
    final response =
        await apiConsumer.get(ApiEndPoints.topRatedMovies, queryParameters: {
      'page': page,
    });
    final topRatedMoviesList = response['results'] as List;
    return List<MovieModel>.from(
        (topRatedMoviesList).map((e) => MovieModel.fromJson(e)));
  }

  @override
  Future<List<MovieModel>> getNowPlayingMovies({required int page}) async {
    final response =
        await apiConsumer.get(ApiEndPoints.nowPlayingMovies, queryParameters: {
      'page': page,
    });
    final nowPlayingMoviesList = response['results'] as List;
    return List<MovieModel>.from((nowPlayingMoviesList)
        .map((currentMovie) => MovieModel.fromJson(currentMovie)));
  }

  @override
  Future<List<MovieModel>> getUpcomingMovies({required int page}) async {
    final response =
        await apiConsumer.get(ApiEndPoints.upcomingMovies, queryParameters: {
      'page': page,
    });
    final upcomingMoviesList = response['results'] as List;
    return List<MovieModel>.from(
        (upcomingMoviesList).map((e) => MovieModel.fromJson(e)));
  }

  @override
  Future<List<MovieModel>> getLatestMovies({required int page}) async {
    final response =
        await apiConsumer.get(ApiEndPoints.latestMovies, queryParameters: {
      'page': page,
    });
    final latestMoviesList = response['results'] as List;
    return List<MovieModel>.from(
        (latestMoviesList).map((e) => MovieModel.fromJson(e)));
  }
}
