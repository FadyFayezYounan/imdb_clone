import 'package:movies_app/features/home/data/models/movie_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<MovieModel>> getPopularMovies({required int page});
  Future<List<MovieModel>> getTopRatedMovies({required int page});
  Future<List<MovieModel>> getNowPlayingMovies({required int page});
  Future<List<MovieModel>> getUpcomingMovies({required int page});
  Future<List<MovieModel>> getLatestMovies({required int page});
}
