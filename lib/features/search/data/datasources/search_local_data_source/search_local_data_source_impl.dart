import 'dart:convert';

import 'package:movies_app/core/local_storage/local_storage_keys.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';

import '../../../../../core/local_storage/local_storage_consumer.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../helpers/limited_list.dart';
import 'search_local_data_source.dart';

class SearchLocalDataSourceImpl implements SearchLocalDataSource {
  final LocalStorageConsumer localStorageConsumer;

  SearchLocalDataSourceImpl({required this.localStorageConsumer});
  @override
  Future<bool> cacheSearchedMovie(
      {required List<MovieModel> movieModel}) async {
    final moviesAsListOfString =
        movieModel.map((model) => jsonEncode(model.toJson())).toList();

    return await localStorageConsumer.saveData(
      key: LocalStorageKeys.searchedMoviesHistoryListKey,
      value: moviesAsListOfString,
    );
  }

  @override
  List<MovieModel>? getCachedSearchedMovies() {
    List<String>? cachedList = _getCachedSearchedMoviesAsStringList();
    if (cachedList == null) return null;
    return List.from(cachedList.map((cachedMovie) {
      final json = jsonDecode(cachedMovie);
      return MovieModel.fromJson(json);
    }).toList());
  }

  List<String>? _getCachedSearchedMoviesAsStringList() {
    return localStorageConsumer.getCachedList(
        key: LocalStorageKeys.searchedMoviesHistoryListKey);
  }

  @override
  Future<bool> deleteSearchHistory() async {
    return await localStorageConsumer.removeDataByKey(
      key: LocalStorageKeys.searchedMoviesHistoryListKey,
    );
  }

  @override
  Future<bool> deleteSearchMovie({
    required MovieModel movieModel,
  }) async {
    LimitedList<String> limitedList =
        LimitedList(AppConstants.searchHistoryLimit);
    List<String>? cachedList = _getCachedSearchedMoviesAsStringList();
    if (cachedList == null) return await Future.value(false);
    limitedList.setList = cachedList;
    // remove the movie from the list then save the new list.
    limitedList.remove(jsonEncode(movieModel.toJson()));
    return await localStorageConsumer.saveData(
      key: LocalStorageKeys.searchedMoviesHistoryListKey,
      value: limitedList.toList,
    );
  }
}
// import 'dart:convert';

// import 'package:movies_app/core/local_storage/local_storage_keys.dart';
// import 'package:movies_app/features/home/data/models/movie_model.dart';

// import '../../../../../core/local_storage/local_storage_consumer.dart';
// import '../../../../../core/utils/app_constants.dart';
// import '../../../../../helpers/limited_list.dart';
// import 'search_local_data_source.dart';

// class SearchLocalDataSourceImpl implements SearchLocalDataSource {
//   final LocalStorageConsumer localStorageConsumer;

//   SearchLocalDataSourceImpl({required this.localStorageConsumer});
//   @override
//   Future<bool> cacheSearchedMovie({required MovieModel movieModel}) async {
//     List<String>? cachedList = _getCachedSearchedMoviesAsStringList();
//     if (cachedList == null) {
//       return await localStorageConsumer.saveData(
//         key: LocalStorageKeys.searchedMoviesHistoryListKey,
//         value: [
//           jsonEncode(movieModel.toJson()),
//         ],
//       );
//     }
//     LimitedList<String> limitedList =
//         LimitedList(AppConstants.searchHistoryLimit, cachedList);
//     limitedList.add(jsonEncode(movieModel.toJson()));
//     return await localStorageConsumer.saveData(
//       key: LocalStorageKeys.searchedMoviesHistoryListKey,
//       value: limitedList.toList(),
//     );
//   }

//   @override
//   List<MovieModel>? getCachedSearchedMovies() {
//     List<String>? cachedList = _getCachedSearchedMoviesAsStringList();
//     if (cachedList == null) return null;
//     return List.from(cachedList.map((cachedMovie) {
//       final json = jsonDecode(cachedMovie);
//       return MovieModel.fromJson(json);
//     }).toList());
//   }

//   List<String>? _getCachedSearchedMoviesAsStringList() {
//     return localStorageConsumer.getCachedList(
//         key: LocalStorageKeys.searchedMoviesHistoryListKey);
//   }

//   @override
//   Future<bool> deleteSearchHistory() async {
//     return await localStorageConsumer.removeDataByKey(
//       key: LocalStorageKeys.searchedMoviesHistoryListKey,
//     );
//   }

//   @override
//   Future<bool> deleteSearchMovie({
//     required MovieModel movieModel,
//   }) async {
//     List<String>? cachedList = _getCachedSearchedMoviesAsStringList();
//     if (cachedList == null) return await Future.value(false);
//     LimitedList<String> limitedList =
//         LimitedList(AppConstants.searchHistoryLimit, cachedList);
//     // remove the movie from the list then save the new list.
//     limitedList.remove(jsonEncode(movieModel.toJson()));
//     return await localStorageConsumer.saveData(
//       key: LocalStorageKeys.searchedMoviesHistoryListKey,
//       value: limitedList.toList(),
//     );
//   }
// }
