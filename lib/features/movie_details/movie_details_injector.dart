import 'package:movies_app/features/movie_details/data/datasources/movie_details_remote_data_source_impl.dart';
import 'package:movies_app/features/movie_details/data/repositories/movie_details_repository_impl.dart';
import 'package:movies_app/features/movie_details/domain/usecases/get_movie_cast_and_crew_usecase.dart';
import 'package:movies_app/features/movie_details/domain/usecases/get_movie_details_by_id_usecase.dart';
import 'package:movies_app/features/movie_details/domain/usecases/get_movie_images_usecase.dart';
import 'package:movies_app/features/movie_details/domain/usecases/get_recommended_movie_usecase.dart';
import 'package:movies_app/features/movie_details/domain/usecases/get_similar_movies_by_movie_id_usecase.dart';
import 'package:movies_app/features/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/cubit/movie_videos_cubit/movie_videos_cubit.dart';

import '../../app_injector.dart';
import 'data/datasources/movie_details_remote_data_source.dart';
import 'domain/repositories/movie_details_repository.dart';
import 'domain/usecases/get_movie_keywords_by_id_usecase.dart';
import 'domain/usecases/get_movie_videos_usecase.dart';
import 'domain/usecases/get_movies_by_category_id_usecase.dart';
import 'domain/usecases/get_movies_by_keyword_id_usecase.dart';

class MovieDetailsInjector {
  static void init() {
    sl.registerFactory(
      () => MovieDetailsCubit(
        getMovieDetailsByIdUseCase: sl(),
        getMovieCastAndCrewUseCase: sl(),
        getSimilarMoviesByMovieIdUseCase: sl(),
        getMovieImagesUseCase: sl(),
        getRecommendedMoviesUseCase: sl(),
        getMoviesByCategoryIdUseCase: sl(),
        getMovieKeywordsByIdUseCase: sl(),
        getMoviesByKeywordIdUseCase: sl(),
        // getMovieVideosUseCase: sl(),
      ),
    );
    sl.registerFactory(
      () => MovieVideosCubit(
        getMovieVideosUseCase: sl(),
      ),
    );

    //data sources
    sl.registerLazySingleton<MovieRemoteDataSource>(
        () => MovieRemoteDataSourceImpl(apiConsumer: sl()));

    //repo
    sl.registerLazySingleton<MovieDetailsRepository>(() =>
        MovieDetailsRepositoryImpl(
            networkInfo: sl(), movieRemoteDataSource: sl()));
    //use cases
    sl.registerLazySingleton(
        () => GetMovieDetailsByIdUseCase(movieDetailsRepository: sl()));
    sl.registerLazySingleton(
        () => GetMovieCastAndCrewUseCase(movieDetailsRepository: sl()));
    sl.registerLazySingleton(
        () => GetSimilarMoviesByMovieIdUseCase(movieDetailsRepository: sl()));
    sl.registerLazySingleton(
        () => GetMovieImagesUseCase(movieDetailsRepository: sl()));
    sl.registerLazySingleton(
        () => GetRecommendedMoviesUseCase(movieDetailsRepository: sl()));
    sl.registerLazySingleton(
        () => GetMoviesByCategoryIdUseCase(movieDetailsRepository: sl()));
    sl.registerLazySingleton(
        () => GetMovieKeywordsByIdUseCase(movieDetailsRepository: sl()));
    sl.registerLazySingleton(
        () => GetMoviesByKeywordIdUseCase(movieDetailsRepository: sl()));
    sl.registerLazySingleton(
        () => GetMovieVideosUseCase(movieDetailsRepository: sl()));
  }
}
