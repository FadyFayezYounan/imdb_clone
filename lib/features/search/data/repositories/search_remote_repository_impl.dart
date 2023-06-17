import 'package:dartz/dartz.dart';
import 'package:movies_app/core/network/network_info.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity/genre_entity.dart';
import 'package:movies_app/features/search/data/datasources/search_remote_data_source/search_remote_data_source.dart';
import 'package:movies_app/features/search/domain/repositories/search_remote_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/utils/app_strings.dart';

class SearchRemoteRepositoryImpl implements SearchRemoteRepository {
  final NetworkInfo networkInfo;
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRemoteRepositoryImpl({
    required this.networkInfo,
    required this.searchRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<MovieEntity>>> searchMovies(
      {required String? query}) async {
    if (await networkInfo.isConnected) {
      try {
        final searchMoviesList =
            await searchRemoteDataSource.searchMovies(query: query);
        return Right(searchMoviesList);
      } on ServerException catch (e) {
        return Left(
            ServerFailure(message: e.message ?? AppStrings.unExpectedError));
      }
    } else {
      return const Left(NetworkFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, List<GenreEntity>>> getAllGenres() async {
    if (await networkInfo.isConnected) {
      try {
        final allMoviesGenres = await searchRemoteDataSource.getAllGenres();
        return Right(allMoviesGenres);
      } on ServerException catch (e) {
        return Left(
            ServerFailure(message: e.message ?? AppStrings.unExpectedError));
      }
    } else {
      return const Left(NetworkFailure(message: 'No Internet Connection'));
    }
  }
  // @override
  // Future<List<MovieEntity>> searchMovies({required String? query}) async {
  //   try {
  //     final moviesByCategoryId =
  //         await searchRemoteDataSource.searchMovies(query: query);
  //     return moviesByCategoryId;
  //   } on ServerException catch (e) {
  //     throw ServerFailure(message: e.message ?? AppStrings.unExpectedError);
  //   }
  // }
}
