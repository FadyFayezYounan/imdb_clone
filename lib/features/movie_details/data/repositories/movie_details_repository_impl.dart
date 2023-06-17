import 'package:movies_app/features/movie_details/data/datasources/movie_details_remote_data_source.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_cast_and_crew_entity/movie_cast_and_crew_entity.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity/genre_entity.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity/movie_details_entity.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_videos_entity/movie_video_entity.dart';
import 'package:movies_app/features/movie_details/domain/usecases/get_movie_images_usecase.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_images_entity/movie_images_entity.dart';
import 'package:movies_app/features/movie_details/domain/usecases/get_movies_by_category_id_usecase.dart';
import 'package:movies_app/features/movie_details/domain/usecases/get_movies_by_keyword_id_usecase.dart';
import 'package:movies_app/features/movie_details/domain/usecases/get_recommended_movie_usecase.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../../domain/repositories/movie_details_repository.dart';
import '../../domain/usecases/get_similar_movies_by_movie_id_usecase.dart';

class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  final NetworkInfo networkInfo;
  final MovieRemoteDataSource movieRemoteDataSource;

  MovieDetailsRepositoryImpl({
    required this.networkInfo,
    required this.movieRemoteDataSource,
  });
  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetailsById(
      {required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final movieDetails =
            await movieRemoteDataSource.getMovieDetailsById(id: id);
        return Right(movieDetails);
      } on ServerException catch (e) {
        return Left(
            ServerFailure(message: e.message ?? AppStrings.unExpectedError));
      }
    } else {
      return const Left(NetworkFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, MovieCastAndCrewEntity>> getMovieCastAndCrewById(
      {required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final movieCastAndCrew =
            await movieRemoteDataSource.getMovieCastAndCrewById(id: id);
        return Right(movieCastAndCrew);
      } on ServerException catch (e) {
        return Left(
            ServerFailure(message: e.message ?? AppStrings.unExpectedError));
      }
    } else {
      return const Left(NetworkFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getSimilarMoviesByMovieId(
      {required GetSimilarMoviesByMovieIdParams
          getSimilarMoviesByMovieIdParams}) async {
    if (await networkInfo.isConnected) {
      try {
        final similarMoviesList =
            await movieRemoteDataSource.getSimilarMoviesByMovieId(
                getSimilarMoviesByMovieIdParams:
                    getSimilarMoviesByMovieIdParams);
        return Right(similarMoviesList);
      } on ServerException catch (e) {
        return Left(
            ServerFailure(message: e.message ?? AppStrings.unExpectedError));
      }
    } else {
      return const Left(NetworkFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, MovieImagesEntity>> getMovieImages(
      {required GetMovieImagesParams getMovieImagesParams}) async {
    if (await networkInfo.isConnected) {
      try {
        final movieImages = await movieRemoteDataSource.getMovieImages(
            getMovieImagesParams: getMovieImagesParams);
        return Right(movieImages);
      } on ServerException catch (e) {
        return Left(
            ServerFailure(message: e.message ?? AppStrings.unExpectedError));
      }
    } else {
      return const Left(NetworkFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getRecommendedMovies(
      {required GetRecommendedMoviesParams getRecommendedMoviesParams}) async {
    if (await networkInfo.isConnected) {
      try {
        final recommendedMoviesList =
            await movieRemoteDataSource.getRecommendedMovies(
                getRecommendedMoviesParams: getRecommendedMoviesParams);
        return Right(recommendedMoviesList);
      } on ServerException catch (e) {
        return Left(
            ServerFailure(message: e.message ?? AppStrings.unExpectedError));
      }
    } else {
      return const Left(NetworkFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getMoviesByCategoryId(
      {required GetMoviesByCategoryIdParams
          getMoviesByCategoryIdParams}) async {
    if (await networkInfo.isConnected) {
      try {
        final moviesByCategoryId =
            await movieRemoteDataSource.getMoviesByCategoryId(
                getMoviesByCategoryIdParams: getMoviesByCategoryIdParams);
        return Right(moviesByCategoryId);
      } on ServerException catch (e) {
        return Left(
            ServerFailure(message: e.message ?? AppStrings.unExpectedError));
      }
    } else {
      return const Left(NetworkFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, List<GenreEntity>>> getMovieKeywordsById(
      {required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final moviesKeywordsList =
            await movieRemoteDataSource.getMovieKeywordsById(id: id);
        return Right(moviesKeywordsList);
      } on ServerException catch (e) {
        return Left(
            ServerFailure(message: e.message ?? AppStrings.unExpectedError));
      }
    } else {
      return const Left(NetworkFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getMoviesByKeywordId(
      {required GetMoviesByKeywordIdParams getMoviesByKeywordIdParams}) async {
    if (await networkInfo.isConnected) {
      try {
        final moviesByKeywordId =
            await movieRemoteDataSource.getMoviesByKeywordId(
          getMoviesByKeywordIdParams: getMoviesByKeywordIdParams,
        );
        return Right(moviesByKeywordId);
      } on ServerException catch (e) {
        return Left(
            ServerFailure(message: e.message ?? AppStrings.unExpectedError));
      }
    } else {
      return const Left(NetworkFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, List<MovieVideoEntity>>> getMovieVideos(
      {required int movieId}) async {
    if (await networkInfo.isConnected) {
      try {
        final moviesVideos =
            await movieRemoteDataSource.getMovieVideos(id: movieId);
        return Right(moviesVideos);
      } on ServerException catch (e) {
        return Left(
            ServerFailure(message: e.message ?? AppStrings.unExpectedError));
      }
    } else {
      return const Left(NetworkFailure(message: 'No Internet Connection'));
    }
  }
}
