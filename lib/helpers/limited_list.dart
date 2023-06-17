import 'dart:developer';

/// this class i used to make list that has a limit number of items.
/// when reach this limit it removes the last item and add the new item at the first.
/// if the item already exists it remove it an add it at the top of the list.
class LimitedList<T> {
  final int _limit;
  final List<T> _list = [];

  LimitedList(
    this._limit,
  );
  set setList(List<T> list) => _list.addAll(list);
  List<T> get toList => _list;

  void add(T item) {
    if (_list.contains(item)) {
      log('this movie already exist --> $item');
      _list.remove(item);
      _list.insert(0, item);
      return;
    }
    if (_list.length == _limit) {
      _list.removeLast();
    }
    _list.insert(0, item);
  }

  void remove(T item) {
    _list.remove(item);
  }

  void clear() {
    _list.clear();
  }
}
