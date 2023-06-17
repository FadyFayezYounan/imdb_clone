import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../entities/movie_cast_and_crew_entity/movie_cast_and_crew_entity.dart';
import '../entities/movie_details_entity/genre_entity.dart';
import '../entities/movie_details_entity/movie_details_entity.dart';
import '../entities/movie_images_entity/movie_images_entity.dart';
import '../entities/movie_videos_entity/movie_video_entity.dart';
import '../usecases/get_movie_images_usecase.dart';
import '../usecases/get_movies_by_category_id_usecase.dart';
import '../usecases/get_movies_by_keyword_id_usecase.dart';
import '../usecases/get_recommended_movie_usecase.dart';
import '../usecases/get_similar_movies_by_movie_id_usecase.dart';

abstract class MovieDetailsRepository {
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetailsById(
      {required int id});
  Future<Either<Failure, MovieCastAndCrewEntity>> getMovieCastAndCrewById(
      {required int id});
  Future<Either<Failure, List<MovieEntity>>> getSimilarMoviesByMovieId(
      {required GetSimilarMoviesByMovieIdParams
          getSimilarMoviesByMovieIdParams});
  Future<Either<Failure, MovieImagesEntity>> getMovieImages({
    required GetMovieImagesParams getMovieImagesParams,
  });
  Future<Either<Failure, List<MovieEntity>>> getRecommendedMovies({
    required GetRecommendedMoviesParams getRecommendedMoviesParams,
  });

  Future<Either<Failure, List<MovieEntity>>> getMoviesByCategoryId({
    required GetMoviesByCategoryIdParams getMoviesByCategoryIdParams,
  });
  Future<Either<Failure, List<GenreEntity>>> getMovieKeywordsById(
      {required int id});
  Future<Either<Failure, List<MovieEntity>>> getMoviesByKeywordId({
    required GetMoviesByKeywordIdParams getMoviesByKeywordIdParams,
  });
  Future<Either<Failure, List<MovieVideoEntity>>> getMovieVideos(
      {required int movieId});
}
