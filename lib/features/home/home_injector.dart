import 'package:movies_app/features/home/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/features/home/domain/usecases/get_to_rated_movies_usecase.dart';
import 'package:movies_app/features/home/domain/usecases/get_upcoming_movies_usecase.dart';
import 'package:movies_app/features/home/presentation/cubit/home_cubit.dart';

import '../../app_injector.dart';
import 'data/datasources/home_remote_data_source.dart';
import 'data/datasources/home_remote_data_source_impl.dart';
import 'data/repositories/home_repository_impl.dart';
import 'domain/repositories/home_repository.dart';
import 'domain/usecases/get_latest_movies_usecase.dart';
import 'domain/usecases/get_popular_movies_usecase.dart';

class HomeInjector {
  static void init() {
    sl.registerFactory(() => HomeCubit(
          getPopularMoviesUsecase: sl(),
          getTopRatedMoviesUsecase: sl(),
          getNowPlayingMoviesUseCase: sl(),
          getUpcomingMoviesUseCase: sl(),
          getLatestMoviesUseCase: sl(),
        ));

    //data sources

    sl.registerLazySingleton<HomeRemoteDataSource>(
        () => HomeRemoteDataSourceImpl(apiConsumer: sl()));

    //repo
    sl.registerLazySingleton<HomeRepository>(() =>
        HomeRepositoryImpl(networkInfo: sl(), homeRemoteDataSource: sl()));

    //usecases
    sl.registerLazySingleton(
        () => GetPopularMoviesUsecase(homeRepository: sl()));
    sl.registerLazySingleton(
        () => GetTopRatedMoviesUsecase(homeRepository: sl()));
    sl.registerLazySingleton(
        () => GetNowPlayingMoviesUseCase(homeRepository: sl()));
    sl.registerLazySingleton(
        () => GetUpcomingMoviesUseCase(homeRepository: sl()));
    sl.registerLazySingleton(
        () => GetLatestMoviesUseCase(homeRepository: sl()));
  }
}
