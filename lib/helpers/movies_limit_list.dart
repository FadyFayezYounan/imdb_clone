// import 'dart:developer';

// /// this class i used to make list that has a limit number of items.
// /// when reach this limit it removes the last item and add the new item at the first.
// /// if the item already exists it remove it an add it at the top of the list.
// class LimitedList<T> {
//   final int _limit;
//   final List<T> _list;

//   LimitedList(this._limit, this._list);

//   void add(T item) {
//     if (_list.contains(item)) {
//       log('this movie already exist --> $item');
//       _list.remove(item);
//       _list.insert(0, item);
//       return;
//     }
//     if (_list.length == _limit) {
//       _list.removeLast();
//     }
//     _list.insert(0, item);
//   }

//   void remove(T item) {
//     _list.remove(item);
//   }

//   void clear() {
//     _list.clear();
//   }

//   List<T> toList() => _list;
// }
// // import 'dart:developer';

// // import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

// // /// this class i used to make list that has a limit number of items.
// // /// when reach this limit it removes the last item and add the new item at the first.
// // /// if the item already exists it remove it an add it at the top of the list.
// // class MoviesLimitedList {
// //   final int _limit;
// //   List<MovieEntity> _list = [];

// //   MoviesLimitedList(this._limit);
// //   List<MovieEntity> get toList => _list;
// //   set setMovieHistoryList(List<MovieEntity> newList) {
// //     _list = newList;
// //     log('movies length =========>${_list.length} ');
// //   }
// //   //set setMovieHistoryList(List<MovieEntity> newList) => _list = newList;

// //   void add({required MovieEntity movie, required int id}) {
// //     log('movies length =========>${_list.length} ');
// //     // the movie already exist
// //     for (int i = 0; i < _list.length; i++) {
// //       //log('checking ${_list[i].id} == $id =>${_list[i].id == id}');
// //       if (_list[i].id == id) {
// //         //log('checking ${_list[i].id} == $id =>${_list[i].id == id}');
// //         _list.remove(movie);
// //         _list.insert(0, movie);
// //         return;
// //       }
// //     }
// //     // for (var movie in _list) {
// //     //   if (movie.id == item.id) {
// //     //     _list.remove(item);
// //     //     _list.insert(0, item);
// //     //     return;
// //     //   }
// //     // }
// //     if (_list.length == _limit) {
// //       _list.removeLast();
// //     }
// //     _list.insert(0, movie);
// //   }

// //   void remove(MovieEntity item) {
// //     _list.remove(item);
// //   }

// //   void clear() {
// //     _list.clear();
// //   }

// //   // List<MovieEntity> toList() => _list;
// // }
