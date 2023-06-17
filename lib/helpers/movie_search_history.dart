import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

class MovieSearchHistoryLogic {
  final int _limit;
  final List<MovieEntity> _searchHistory = [];
  MovieSearchHistoryLogic(this._limit);

  set setList(List<MovieEntity> list) => _searchHistory.addAll(list);
  List<MovieEntity> get searchHistoryList => _searchHistory.reversed.toList();

  List<MovieEntity>? filteredSearchHistory;
  List<MovieEntity> filterSearchTerms({
    required String? filter,
  }) {
    if (filter != null && filter.isNotEmpty) {
      // Reversed because we want the last added items to appear first in the UI
      return _searchHistory.reversed
          .where((movie) => movie.title.startsWith(filter))
          .toList();
    } else {
      return _searchHistory.reversed.toList();
    }
  }

  void addMovie(MovieEntity movie) {
    if (_searchHistory.contains(movie)) {
      _putSearchMovieFirst(movie);
      return;
    }
    _searchHistory.add(movie);
    if (_searchHistory.length > _limit) {
      _searchHistory.removeRange(0, _searchHistory.length - _limit);
    }
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void _putSearchMovieFirst(MovieEntity movie) {
    deleteMovie(movie);
    addMovie(movie);
  }

  void deleteMovie(MovieEntity deletedMovie) {
    _searchHistory.removeWhere((movie) => movie.id == deletedMovie.id);
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void clear() {
    _searchHistory.clear();
  }
}
