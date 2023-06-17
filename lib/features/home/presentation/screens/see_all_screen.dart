import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import '../widgets/see_all/first_page_error_widget.dart';
import '../widgets/see_all/no_items_founded_widget.dart';
import '../widgets/see_all/see_all_movie_widget.dart';

// in this app i make the pagination manually
// you can use this awesome package that called infinite_scroll_pagination
//and this is it's implementation.
class SeeAllScreen<getMovieFunctionName> extends StatefulWidget {
  const SeeAllScreen({
    super.key,
    required this.getMoviesFunc,
    required this.pageTitle,
  });
  final String pageTitle;
  final Future<List<MovieEntity>> Function(int page) getMoviesFunc;

  @override
  State<SeeAllScreen> createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {
  final int _pageLimit = 20;
  final _pagingController = PagingController<int, MovieEntity>(
    firstPageKey: 1,
  );

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await widget.getMoviesFunc(pageKey);
      final isLastPage = newItems.length < _pageLimit;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.sync(
          () => _pagingController.refresh(),
        ),
        child: PagedListView.separated(
          pagingController: _pagingController,
          padding: const EdgeInsets.all(16),
          separatorBuilder: (context, index) => const Divider(),
          builderDelegate: PagedChildBuilderDelegate<MovieEntity>(
            itemBuilder: (context, movieEntity, index) =>
                SeeAllMovieWidget(movieEntity: movieEntity),
            firstPageErrorIndicatorBuilder: (context) => FirstPageErrorWidget(
              error: _pagingController.error,
            ),
            noItemsFoundIndicatorBuilder: (context) =>
                const NoItemsFoundedWidget(),
          ),
        ),
      ),
    );
  }
}
