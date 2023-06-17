import 'package:movies_app/features/search/data/datasources/search_local_data_source/search_local_data_source.dart';
import 'package:movies_app/features/search/data/datasources/search_remote_data_source/search_remote_data_source_impl.dart';
import 'package:movies_app/features/search/data/repositories/search_remote_repository_impl.dart';
import 'package:movies_app/features/search/domain/repositories/search_local_repository.dart';
import 'package:movies_app/features/search/domain/usecases/cache_searched_movie_usecase.dart';
import 'package:movies_app/features/search/domain/usecases/get_cached_searched_movies_usecase.dart';
import 'package:movies_app/features/search/domain/usecases/search_movies_usecase.dart';
import 'package:movies_app/features/search/presentation/cubit/search_cubit.dart';

import '../../app_injector.dart';
import 'data/datasources/search_local_data_source/search_local_data_source_impl.dart';
import 'data/datasources/search_remote_data_source/search_remote_data_source.dart';
import 'data/repositories/search_local_repository_impl.dart';
import 'domain/repositories/search_remote_repository.dart';
import 'domain/usecases/delete_search_history_usecase.dart';
import 'domain/usecases/delete_search_movie_usecase.dart';
import 'domain/usecases/get_genres_usecase.dart';

class SearchInjector {
  static void init() {
    sl.registerFactory(() => SearchCubit(
          searchMoviesUseCase: sl(),
          getGenresUseCase: sl(),
          //this usecase already registered in movie details injector.
          getMoviesByCategoryIdUseCase: sl(),
          cacheSearchedMovieUseCase: sl(),
          getCachedSearchedMoviesUseCase: sl(),
          deleteSearchMovieUseCase: sl(),
          deleteSearchHistoryUseCase: sl(),
        ));
    // use cases
    sl.registerLazySingleton(
        () => SearchMoviesUseCase(searchRemoteRepository: sl()));
    sl.registerLazySingleton(
        () => GetGenresUseCase(searchRemoteRepository: sl()));
    sl.registerLazySingleton(
        () => CacheSearchedMovieUseCase(searchLocalRepository: sl()));
    sl.registerLazySingleton(
        () => GetCachedSearchedMoviesUseCase(searchLocalRepository: sl()));
    sl.registerLazySingleton(
        () => DeleteSearchMovieUseCase(searchLocalRepository: sl()));
    sl.registerLazySingleton(
        () => DeleteSearchHistoryUseCase(searchLocalRepository: sl()));

    // repo
    sl.registerLazySingleton<SearchRemoteRepository>(
        () => SearchRemoteRepositoryImpl(
              networkInfo: sl(),
              searchRemoteDataSource: sl(),
            ));
    sl.registerLazySingleton<SearchLocalRepository>(
        () => SearchLocalRepositoryImpl(
              searchLocalDataSource: sl(),
            ));

    // data sources
    sl.registerLazySingleton<SearchRemoteDataSource>(
        () => SearchRemoteDataSourceImpl(apiConsumer: sl()));
    sl.registerLazySingleton<SearchLocalDataSource>(
        () => SearchLocalDataSourceImpl(localStorageConsumer: sl()));
  }
}
