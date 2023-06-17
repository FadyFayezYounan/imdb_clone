import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/usecase/usecase.dart';
import 'package:movies_app/core/utils/utils.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity/genre_entity.dart';
import 'package:movies_app/features/search/domain/usecases/cache_searched_movie_usecase.dart';
import 'package:movies_app/features/search/domain/usecases/delete_search_history_usecase.dart';
import 'package:movies_app/features/search/domain/usecases/delete_search_movie_usecase.dart';
import 'package:movies_app/features/search/domain/usecases/get_cached_searched_movies_usecase.dart';
import 'package:movies_app/features/search/domain/usecases/get_genres_usecase.dart';
import 'package:movies_app/features/search/domain/usecases/search_movies_usecase.dart';

import '../../../../helpers/limited_list.dart';
import '../../../movie_details/domain/usecases/get_movies_by_category_id_usecase.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchMoviesUseCase searchMoviesUseCase;
  final GetGenresUseCase getGenresUseCase;
  final GetMoviesByCategoryIdUseCase getMoviesByCategoryIdUseCase;
  final CacheSearchedMovieUseCase cacheSearchedMovieUseCase;
  final GetCachedSearchedMoviesUseCase getCachedSearchedMoviesUseCase;
  final DeleteSearchMovieUseCase deleteSearchMovieUseCase;
  final DeleteSearchHistoryUseCase deleteSearchHistoryUseCase;
  SearchCubit({
    required this.searchMoviesUseCase,
    required this.getGenresUseCase,
    required this.getMoviesByCategoryIdUseCase,
    required this.cacheSearchedMovieUseCase,
    required this.getCachedSearchedMoviesUseCase,
    required this.deleteSearchMovieUseCase,
    required this.deleteSearchHistoryUseCase,
  }) : super(SearchInitial());

  List<MovieEntity> _searchMovies = [];
  List<MovieEntity> get getSearchMoviesList => List.unmodifiable(_searchMovies);
  Future<void> searchMoviesFunc({required String? query}) async {
    emit(SearchMoviesLoadingState());
    final result = await searchMoviesUseCase(query);
    result.fold(
      (failure) {
        emit(SearchMoviesErrorState(errorMessage: failure.faiMessage));
      },
      (moviesList) {
        _searchMovies = moviesList;
        emit(SearchMoviesSuccessState());
      },
    );
  }

  List<GenreEntity> _allMoviesGenres = [];
  List<GenreEntity> get allMoviesGenres => List.unmodifiable(_allMoviesGenres);

  Future<void> getAllMoviesGenresFunc() async {
    emit(GetAllMoviesGenresLoadingState());
    final result = await getGenresUseCase(NoParams());
    result.fold(
      (failure) {
        emit(GetAllMoviesGenresErrorState(errorMessage: failure.faiMessage));
      },
      (moviesGenresList) {
        _allMoviesGenres = moviesGenresList;
        emit(GetAllMoviesGenresSuccessState());
      },
    );
  }

  Future<List<MovieEntity>> getMoviesByCategoryIdPaginated(
    int categoryId,
    int page,
  ) async {
    List<MovieEntity> moviesByCategoryIdList = [];
    final result = await getMoviesByCategoryIdUseCase(
        GetMoviesByCategoryIdParams(categoryId: categoryId, page: page));
    result.fold(
      (failure) {
        // in case error happened it returns an empty list
      },
      (moviesList) {
        moviesByCategoryIdList = moviesList;
      },
    );
    return moviesByCategoryIdList;
  }

  final LimitedList<MovieEntity> _searchHistoryLimitedList = LimitedList(
      AppConstants.searchHistoryLimit); //AppConstants.searchHistoryLimit
  List<MovieEntity> get cachedMoviesList => _searchHistoryLimitedList.toList;
  void getCachedMoviesListFunc() {
    List<MovieEntity>? cachedMoviesList = getCachedSearchedMoviesUseCase();
    _searchHistoryLimitedList.setList = cachedMoviesList ?? [];
  }

  Future<void> cacheSearchedMovieFunc(MovieEntity movieEntity) async {
    _searchHistoryLimitedList.add(movieEntity);
    // log(_searchHistoryLimitedList.toList().toString());
    final result =
        await cacheSearchedMovieUseCase(_searchHistoryLimitedList.toList);
    result.fold((failure) {}, (success) {});
  }

  void clearSearchHistory() async {
    _searchHistoryLimitedList.clear();
    emit(ClearSearchHistorySuccessState());
    // update UI then remove the item from the cache.
    final result = await deleteSearchHistoryUseCase(NoParams());
    result.fold((failure) {}, (success) {});
  }

  void deleteSearchMovie(MovieEntity movieEntity) async {
    emit(DeleteSearchMovieLoadingState());
    _searchHistoryLimitedList.remove(movieEntity);
    emit(DeleteSearchMovieSuccessState());
    // update UI then remove the item from the cache.
    final result = await deleteSearchMovieUseCase(movieEntity);
    result.fold((failure) {}, (success) {});
  }
}
