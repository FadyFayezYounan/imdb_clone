import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movies_app/features/home/home_injector.dart';
import 'package:movies_app/features/movie_details/movie_details_injector.dart';
import 'package:movies_app/features/search/search_injector.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/api/api_consumer.dart';
import 'core/api/app_interceptors.dart';
import 'core/api/dio_consumer.dart';
import 'core/local_storage/local_storage_consumer.dart';
import 'core/local_storage/shared_pref_consumer.dart';
import 'core/network/network_info.dart';

GetIt sl = GetIt.instance;

class AppInjector {
  static Future<void> init() async {
    // Features Injectors
    HomeInjector.init();
    MovieDetailsInjector.init();
    SearchInjector.init();
    // Core
    sl.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(internetConnectionChecker: sl()));
    sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

    sl.registerLazySingleton<LocalStorageConsumer>(
        () => SharedPrefConsumer(sharedPreferences: sl()));

    // External

    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);

    sl.registerLazySingleton(() => AppInterceptors());

    sl.registerLazySingleton(() => LogInterceptor(
          request: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          requestHeader: true,
          error: true,
        ));

    sl.registerLazySingleton(() => InternetConnectionChecker());

    sl.registerLazySingleton(() => Dio());
  }
}
