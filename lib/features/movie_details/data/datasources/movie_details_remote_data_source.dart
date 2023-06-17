import 'package:movies_app/features/movie_details/data/models/movie_details_model/genre_model.dart';
import 'package:movies_app/features/movie_details/data/models/movie_details_model/movie_details_model.dart';
import 'package:movies_app/features/movie_details/data/models/movie_images_model/movie_images_model.dart';
import 'package:movies_app/features/movie_details/data/models/movie_videos_model/movie_video_entity.dart';
import '../../../home/data/models/movie_model.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../../domain/entities/movie_cast_and_crew_entity/movie_cast_and_crew_entity.dart';
import '../../domain/usecases/get_movie_images_usecase.dart';
import '../../domain/usecases/get_movies_by_category_id_usecase.dart';
import '../../domain/usecases/get_movies_by_keyword_id_usecase.dart';
import '../../domain/usecases/get_recommended_movie_usecase.dart';
import '../../domain/usecases/get_similar_movies_by_movie_id_usecase.dart';
import '../models/movie_cast_and_crew_model/movie_cast_and_crew_model.dart';

abstract class MovieRemoteDataSource {
  Future<MovieDetailsModel> getMovieDetailsById({required int id});
  Future<MovieCastAndCrewModel> getMovieCastAndCrewById({required int id});
  Future<List<MovieModel>> getSimilarMoviesByMovieId({
    required GetSimilarMoviesByMovieIdParams getSimilarMoviesByMovieIdParams,
  });
  Future<MovieImagesModel> getMovieImages({
    required GetMovieImagesParams getMovieImagesParams,
  });
  Future<List<MovieModel>> getRecommendedMovies(
      {required GetRecommendedMoviesParams getRecommendedMoviesParams});

  Future<List<MovieModel>> getMoviesByCategoryId(
      {required GetMoviesByCategoryIdParams getMoviesByCategoryIdParams});

  Future<List<GenreModel>> getMovieKeywordsById({required int id});
  Future<List<MovieModel>> getMoviesByKeywordId({
    required GetMoviesByKeywordIdParams getMoviesByKeywordIdParams,
  });

  Future<List<MovieVideoModel>> getMovieVideos({required int id});
}
