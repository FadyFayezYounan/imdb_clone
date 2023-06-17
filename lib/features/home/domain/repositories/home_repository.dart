import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/movie_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies(
      {required int page});
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies(
      {required int page});
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies(
      {required int page});
  Future<Either<Failure, List<MovieEntity>>> getUpcomingMovies(
      {required int page});
  Future<Either<Failure, List<MovieEntity>>> getLatestMovies(
      {required int page});
}
