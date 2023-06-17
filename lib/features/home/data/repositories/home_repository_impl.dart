import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/utils/app_strings.dart';
import 'package:movies_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/features/home/domain/repositories/home_repository.dart';
import '../../../../core/network/network_info.dart';

class HomeRepositoryImpl implements HomeRepository {
  final NetworkInfo networkInfo;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({
    required this.networkInfo,
    required this.homeRemoteDataSource,
  });
  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies(
      {required int page}) async {
    if (await networkInfo.isConnected) {
      try {
        final popularMoviesList =
            await homeRemoteDataSource.getPopularMovies(page: page);

        return Right(popularMoviesList);
      } on ServerException catch (e) {
        return Left(
            ServerFailure(message: e.message ?? AppStrings.unExpectedError));
      }
    } else {
      return const Left(NetworkFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies(
      {required int page}) async {
    if (await networkInfo.isConnected) {
      try {
        final topRatedMoviesList =
            await homeRemoteDataSource.getTopRatedMovies(page: page);
        return Right(topRatedMoviesList);
      } on ServerException catch (e) {
        return Left(
            ServerFailure(message: e.message ?? AppStrings.unExpectedError));
      }
    } else {
      return const Left(NetworkFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies(
      {required int page}) async {
    if (await networkInfo.isConnected) {
      try {
        final nowPlayingMoviesList =
            await homeRemoteDataSource.getNowPlayingMovies(page: page);
        return Right(nowPlayingMoviesList);
      } on ServerException catch (e) {
        return Left(
            ServerFailure(message: e.message ?? AppStrings.unExpectedError));
      }
    } else {
      return const Left(NetworkFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getUpcomingMovies(
      {required int page}) async {
    if (await networkInfo.isConnected) {
      try {
        final upcomingMoviesList =
            await homeRemoteDataSource.getUpcomingMovies(page: page);
        return Right(upcomingMoviesList);
      } on ServerException catch (e) {
        return Left(
            ServerFailure(message: e.message ?? AppStrings.unExpectedError));
      }
    } else {
      return const Left(NetworkFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getLatestMovies(
      {required int page}) async {
    if (await networkInfo.isConnected) {
      try {
        final latestMoviesList =
            await homeRemoteDataSource.getLatestMovies(page: page);
        return Right(latestMoviesList);
      } on ServerException catch (e) {
        return Left(
            ServerFailure(message: e.message ?? AppStrings.unExpectedError));
      }
    } else {
      return const Left(NetworkFailure(message: 'No Internet Connection'));
    }
  }
}
