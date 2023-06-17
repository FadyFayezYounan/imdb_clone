class SearchBarLogic<T> {
  final int _limit;
  final List<T> _searchHistory = [];
  SearchBarLogic(this._limit);

  set setList(List<T> list) => _searchHistory.addAll(list);
  List<T> get searchHistoryList => _searchHistory;

  // List<T> filterSearchTerms({
  //   required String? filter,
  // }) {
  //   if (filter != null && filter.isNotEmpty) {
  //     // Reversed because we want the last added items to appear first in the UI
  //     return _searchHistory.reversed.where((term) => term.st).toList();
  //   } else {
  //     return _searchHistory.reversed.toList();
  //   }
  // }

  void add(T item) {
    if (_searchHistory.contains(item)) {}
  }
}
