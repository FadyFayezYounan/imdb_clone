// import 'package:get_it/get_it.dart';
// import 'package:movies_app/movies/data/data_source/movies_remote_data_source.dart';
// import 'package:movies_app/movies/data/repository/movies_repository.dart';
// import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
// import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';

// final sl = GetIt.instance;

// class ServicesLocator {
//   void init() {
//     // USECASES
//     sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
//     // REPOSITORY
//     sl.registerLazySingleton<BaseMoviesRepository>(
//         () => MoviesRepository(sl()));
//     // DATA SOURCE
//     sl.registerLazySingleton<BaseRemoteDataSource>(
//         () => MovieRemoteDataSource());
//   }
// }
