// import 'dart:collection';

// /// this class i used to make list that has a limit number of items.
// /// when reach this limit it removes the last item and add the new item at the first.
// /// if the item already exists it remove it an add it at the top of the list.
// class LimitedList<T> {
//   final int _limit;
//   final ListQueue<T> _list = ListQueue();

//   LimitedList(this._limit);
//   set setList(List<T> list) => _list.addAll(list);

//   void add(T item) {
//     if (_list.contains(item)) {
//       _list.remove(item);
//       _list.addFirst(item);
//       return;
//     }
//     if (_list.length == _limit) {
//       _list.removeLast();
//     }
//     _list.addFirst(item);
//   }

//   void clear() {
//     _list.clear();
//   }

//   void remove(T item) {
//     _list.remove(item);
//   }

//   List<T> toList() => _list.toList();
// }
