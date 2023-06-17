import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/utils.dart';

import '../cubit/search_cubit.dart';
import '../widgets/search_results/empty_search_widget.dart';
import '../widgets/search_results/search_bar_button.dart';
import '../widgets/search_results/search_history_list.dart';
import '../widgets/search_results/search_result_list.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({super.key});

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  final _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.unfocus();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SearchBarButton(
          controller: _controller,
          focusNode: _focusNode,
          onChanged: (query) async {
            await BlocProvider.of<SearchCubit>(context)
                .searchMoviesFunc(query: query.trim());
          },
          enabled: true,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Cancel',
              style: AppTextStyle.title14White.copyWith(
                color: AppColors.blueColor,
              ),
            ),
          ),
        ],
      ),
      body: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          final searchCubit = context.read<SearchCubit>();
          final oldList = searchCubit.getSearchMoviesList;
          if (searchCubit.cachedMoviesList.isNotEmpty &&
              _controller.text.trim().isEmpty) {
            return SearchHistoryList(
              searchHistoryList: searchCubit.cachedMoviesList,
              onClearButtonPressed: searchCubit.clearSearchHistory,
            );
          } else if (_controller.text.trim().isEmpty == true) {
            return const EmptySearchListWidget();
          } else if (state is SearchMoviesLoadingState) {
            return SearchResultsList(
              searchList: oldList,
            );
          }
          return SearchResultsList(
            searchList: searchCubit.getSearchMoviesList,
          );
        },
      ),
    );
  }
}
