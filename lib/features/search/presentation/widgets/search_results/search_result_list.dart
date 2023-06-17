import 'package:flutter/material.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import '../search_movie_item.dart';

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({super.key, required this.searchList});
  final List<MovieEntity> searchList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: searchList.length,
      itemBuilder: (context, index) => SearchMovieItem(
        movieEntity: searchList[index],
      ),
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
// import 'package:movies_app/features/search/presentation/cubit/search_cubit.dart';

// import '../search_movie_item.dart';

// class SearchResultsList extends StatefulWidget {
//   const SearchResultsList({super.key, required this.searchList});
//   final List<MovieEntity> searchList;

//   @override
//   State<SearchResultsList> createState() => _SearchResultsListState();
// }

// class _SearchResultsListState extends State<SearchResultsList> {
//   final _animatedListKey = GlobalKey<AnimatedListState>();

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedList(
//       key: _animatedListKey,
//       initialItemCount: widget.searchList.length,
//       itemBuilder: (context, index, animation) =>
//           _buildSearchItem(context, index, animation),
//     );
//   }

//   void _removeMovie(index) {
//     _animatedListKey.currentState?.removeItem(index, (context, animation) {
//       return _buildSearchItem(context, index, animation);
//     });
//     BlocProvider.of<SearchCubit>(context)
//         .deleteSearchMovie(widget.searchList[index]);
//   }

//   Widget _buildSearchItem(
//       BuildContext context, int index, Animation<double> animation) {
//     return SizeTransition(
//       sizeFactor: animation,
//       child: SearchMovieItem(
//         movieEntity: widget.searchList[index],
//         onDeleteButtonPressed: () => _removeMovie(index),
//       ),
//     );
//   }
// }
