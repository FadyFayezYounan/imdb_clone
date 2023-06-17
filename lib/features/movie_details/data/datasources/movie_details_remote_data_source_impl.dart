import 'package:movies_app/core/api/api_consumer.dart';
import 'package:movies_app/core/api/api_end_points.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/movie_details/data/models/movie_cast_and_crew_model/movie_cast_and_crew_model.dart';
import 'package:movies_app/features/movie_details/data/models/movie_details_model/genre_model.dart';
import 'package:movies_app/features/movie_details/data/models/movie_details_model/movie_details_model.dart';
import 'package:movies_app/features/movie_details/data/models/movie_images_model/movie_images_model.dart';
import 'package:movies_app/features/movie_details/data/models/movie_videos_model/movie_video_entity.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_cast_and_crew_entity/movie_cast_and_crew_entity.dart';
import 'package:movies_app/features/movie_details/domain/usecases/get_movie_images_usecase.dart';
import 'package:movies_app/features/movie_details/domain/usecases/get_movies_by_category_id_usecase.dart';
import 'package:movies_app/features/movie_details/domain/usecases/get_movies_by_keyword_id_usecase.dart';
import 'package:movies_app/features/movie_details/domain/usecases/get_recommended_movie_usecase.dart';

import '../../../home/domain/entities/movie_entity.dart';
import '../../domain/usecases/get_similar_movies_by_movie_id_usecase.dart';
import 'movie_details_remote_data_source.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final ApiConsumer apiConsumer;

  MovieRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<MovieDetailsModel> getMovieDetailsById({required int id}) async {
    final response =
        await apiConsumer.get(ApiEndPoints.movieDetailsById(id: id));

    final movieDetails = response as Map<String, dynamic>;

    return MovieDetailsModel.fromJson(movieDetails);
  }

  @override
  Future<MovieCastAndCrewModel> getMovieCastAndCrewById(
      {required int id}) async {
    final response =
        await apiConsumer.get(ApiEndPoints.movieCastAndCrewById(id: id));

    final movieCastAndCrew = response as Map<String, dynamic>;

    return MovieCastAndCrewModel.fromJson(movieCastAndCrew);
  }

  @override
  Future<List<MovieModel>> getSimilarMoviesByMovieId(
      {required GetSimilarMoviesByMovieIdParams
          getSimilarMoviesByMovieIdParams}) async {
    final response = await apiConsumer.get(
        ApiEndPoints.similarMoviesByMovieId(
            id: getSimilarMoviesByMovieIdParams.id),
        queryParameters: {
          'page': getSimilarMoviesByMovieIdParams.page,
        });
    final similarMoviesList = response['results'] as List;
    return List<MovieModel>.from(
        (similarMoviesList).map((sMovie) => MovieModel.fromJson(sMovie)));
  }

  @override
  Future<MovieImagesModel> getMovieImages(
      {required GetMovieImagesParams getMovieImagesParams}) async {
    final response = await apiConsumer.get(
        ApiEndPoints.getMovieImagesById(id: getMovieImagesParams.id),
        queryParameters: {
          'page': getMovieImagesParams.page,
        });

    final movieImages = response as Map<String, dynamic>;

    return MovieImagesModel.fromJson(movieImages);
  }

  @override
  Future<List<MovieModel>> getRecommendedMovies(
      {required GetRecommendedMoviesParams getRecommendedMoviesParams}) async {
    final response = await apiConsumer.get(
        ApiEndPoints.getRecommendedMovies(id: getRecommendedMoviesParams.id),
        queryParameters: {
          'page': getRecommendedMoviesParams.page,
        });
    final recommendedMoviesList = response['results'] as List;
    return List<MovieModel>.from(
        (recommendedMoviesList).map((rMovie) => MovieModel.fromJson(rMovie)));
  }

  @override
  Future<List<MovieModel>> getMoviesByCategoryId(
      {required GetMoviesByCategoryIdParams
          getMoviesByCategoryIdParams}) async {
    final response = await apiConsumer
        .get(ApiEndPoints.getMoviesByCategoryId, queryParameters: {
      'page': getMoviesByCategoryIdParams.page,
      'sort_by': 'popularity.desc',
      'with_genres': getMoviesByCategoryIdParams.categoryId,
    });
    final recommendedMoviesList = response['results'] as List;
    return List<MovieModel>.from(
        (recommendedMoviesList).map((cMovie) => MovieModel.fromJson(cMovie)));
  }

  @override
  Future<List<GenreModel>> getMovieKeywordsById({required int id}) async {
    final response = await apiConsumer.get(
      ApiEndPoints.getMovieKeywordsById(id: id),
    );
    final keywordsList = response['keywords'] as List;
    return List<GenreModel>.from(
        (keywordsList).map((keyword) => GenreModel.fromJson(keyword)));
  }

  @override
  Future<List<MovieModel>> getMoviesByKeywordId(
      {required GetMoviesByKeywordIdParams getMoviesByKeywordIdParams}) async {
    final response = await apiConsumer.get(
        ApiEndPoints.getRecommendedMovies(id: getMoviesByKeywordIdParams.id),
        queryParameters: {
          'page': getMoviesByKeywordIdParams.page,
        });
    final keywordsMoviesList = response['results'] as List;
    return List<MovieModel>.from(
        (keywordsMoviesList).map((kMovie) => MovieModel.fromJson(kMovie)));
  }

  @override
  Future<List<MovieVideoModel>> getMovieVideos({required int id}) async {
    final response = await apiConsumer.get(
      ApiEndPoints.getMovieVideosByMovieId(id: id),
    );
    final moviesVideosList = response['results'] as List;
    return List<MovieVideoModel>.from(
        (moviesVideosList).map((video) => MovieVideoModel.fromJson(video)));
  }
}
