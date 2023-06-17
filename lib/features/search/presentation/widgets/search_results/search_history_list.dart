import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import '../../../../../core/utils/utils.dart';
import '../../cubit/search_cubit.dart';
import '../search_movie_item.dart';

class SearchHistoryList extends StatelessWidget {
  const SearchHistoryList({
    super.key,
    required this.searchHistoryList,
    required this.onClearButtonPressed,
  });
  final List<MovieEntity> searchHistoryList;
  final VoidCallback onClearButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Searches',
                style: AppTextStyle.body16White,
              ),
              TextButton(
                onPressed: onClearButtonPressed,
                child: Text(
                  'CLEAR',
                  style: AppTextStyle.title14White.copyWith(
                    color: AppColors.blueColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: searchHistoryList.length,
            itemBuilder: (context, index) => SearchMovieItem(
              movieEntity: searchHistoryList[index],
              onDeleteButtonPressed: () {
                BlocProvider.of<SearchCubit>(context)
                    .deleteSearchMovie(searchHistoryList[index]);
              },
            ),
            separatorBuilder: (context, index) => const Divider(),
          ),
        ),
      ],
    );
  }
}







// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
// import 'package:movies_app/features/search/presentation/cubit/search_cubit.dart';

// import '../search_movie_item.dart';

// class SearchHistoryList extends StatefulWidget {
//   const SearchHistoryList({super.key, required this.searchHistoryList});
//   final List<MovieEntity> searchHistoryList;

//   @override
//   State<SearchHistoryList> createState() => _SearchHistoryListState();
// }

// class _SearchHistoryListState extends State<SearchHistoryList> {
//   final _animatedListKey = GlobalKey<AnimatedListState>();

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedList(
//       key: _animatedListKey,
//       initialItemCount: widget.searchHistoryList.length,
//       itemBuilder: (context, index, animation) =>
//           _buildSearchItem(widget.searchHistoryList[index], index, animation),
//     );
//   }

//   void _removeMovie(index) {
//     _animatedListKey.currentState?.removeItem(index, (context, animation) {
//       return _buildSearchItem(
//           widget.searchHistoryList[index], index, animation);
//     });
//     // BlocProvider.of<SearchCubit>(context)
//     //     .deleteSearchMovie(widget.searchHistoryList[index]);
//   }

//   Widget _buildSearchItem(
//       MovieEntity movie, int index, Animation<double> animation) {
//     return SizeTransition(
//       sizeFactor: animation,
//       child: SearchMovieItem(
//         movieEntity: movie,
//         onDeleteButtonPressed: () => _removeMovie(index),
//       ),
//     );
//   }
// }
