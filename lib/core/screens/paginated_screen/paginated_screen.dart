import 'package:flutter/material.dart';
import 'package:movies_app/core/screens/loading_screen.dart';
import 'package:movies_app/core/utils/utils.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/home/domain/entities/paginated_screen_params.dart';

import '../../../features/home/presentation/widgets/see_all/see_all_movie_widget.dart';
part 'paginated_screen_bottom_widgets.dart';

const int _limit = 20;

/// in this page i make a manual pagination.
class PaginatedScreen extends StatefulWidget {
  const PaginatedScreen({
    super.key,
    required this.paginatedScreenParams,
  });
  final PaginatedScreenParams paginatedScreenParams;

  @override
  State<PaginatedScreen> createState() => _PaginatedScreenState();
}

class _PaginatedScreenState extends State<PaginatedScreen> {
  final _PaginatedHasMoreMoviesAndErrorNotifier _hasMoreMoviesAndErrorNotifier =
      _PaginatedHasMoreMoviesAndErrorNotifier(
    _PaginatedLoadingAndErrorValues(hasMoreMovies: true, error: null),
  );
  final ValueNotifier<List<MovieEntity>> _moviesList = ValueNotifier([]);
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);
  final _controller = ScrollController();
  int _page = 1;

  @override
  void initState() {
    super.initState();
    //when the user opens the screen load the movies.
    _getMovies();
    //when the user reaches to the end of the screen load new movies.
    _controller.addListener(() {
      if (_controller.position.maxScrollExtent == _controller.offset) {
        _getMovies();
      }
    });
  }

  void _clearMoviesList() {
    _moviesList.value.clear();
  }

  void addNewMovies(List<MovieEntity> newMovies) {
    _moviesList.value += newMovies;
  }

  Future<void> _getMovies() async {
    if (_isLoading.value ||
        _hasMoreMoviesAndErrorNotifier.errorMessage != null ||
        !_hasMoreMoviesAndErrorNotifier.hasMoreMovies) return;
    _isLoading.value = true;
    final result = await widget.paginatedScreenParams.getMoviesFunc(_page);
    result.fold((failure) {
      //if an error occurred set the error value to failure.faiMessage
      _hasMoreMoviesAndErrorNotifier.changeErrorValue(failure.faiMessage);
      return;
    }, (movies) {
      addNewMovies(movies);
      // when reach here there are two scenarios
      // 1 - no error occurred.
      // 2 - the user reaches to the end of the screen and an error occurred so he press
      // try again button and this time no errors so set the error value to null that's mean that no errors.
      _hasMoreMoviesAndErrorNotifier.changeErrorValue(null);
    });
    // when reach here increase the page count and stop loading.
    _page++;
    _isLoading.value = false;
    // when the loaded movies list become less than the _limit that's mean there are no more movies.
    if (_moviesList.value.length < _limit) {
      _hasMoreMoviesAndErrorNotifier.changeHasMoreMovies(false);
    }
  }

  Future<void> _refreshScreen() async {
    _isLoading.value = false;
    _hasMoreMoviesAndErrorNotifier.changeHasMoreMovies(true);
    _hasMoreMoviesAndErrorNotifier.changeErrorValue(null);
    _page = 1;
    _clearMoviesList();
    await _getMovies();
  }

  @override
  void dispose() {
    _controller.dispose();
    _moviesList.dispose();
    _isLoading.dispose();
    _hasMoreMoviesAndErrorNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.paginatedScreenParams.screenTitle),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshScreen,
        child: ValueListenableBuilder(
          valueListenable: _isLoading,
          builder: (context, isLoading, child) =>
              _determineScreenBody(child!, isLoading),
          child: _buildMoviesList(),
        ),
      ),
    );
  }

  ValueListenableBuilder<List<MovieEntity>> _buildMoviesList() {
    return ValueListenableBuilder(
      valueListenable: _moviesList,
      builder: (context, movies, child) => ListView.separated(
        padding: const EdgeInsets.only(
          top: 16.0,
          left: 16.0,
          right: 16.0,
        ),
        controller: _controller,
        itemBuilder: (context, index) {
          if (index < movies.length) {
            return SeeAllMovieWidget(
              movieEntity: movies[index],
            );
          } else {
            return child;
          }
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: movies.length + 1,
      ),
      child: _buildBottomWidgets(),
    );
  }

  ValueListenableBuilder<_PaginatedLoadingAndErrorValues>
      _buildBottomWidgets() {
    return ValueListenableBuilder(
      valueListenable: _hasMoreMoviesAndErrorNotifier,
      builder: (context, hasMoreMoviesAndErrorNotifier, child) =>
          _PaginatedScreenBottomWidget(
        showLoading: hasMoreMoviesAndErrorNotifier.hasMoreMovies,
        errorMessage: hasMoreMoviesAndErrorNotifier.error,
        onTryAgainPressed: () async {
          _hasMoreMoviesAndErrorNotifier.changeErrorValue(null);
          await _getMovies();
        },
      ),
    );
  }

  Widget _determineScreenBody(Widget child, bool isLoading) {
    if (_moviesList.value.isEmpty && isLoading) {
      return const LoadingScreen(
        isWidget: true,
      );
    } else if (_moviesList.value.isEmpty &&
        _hasMoreMoviesAndErrorNotifier.errorMessage != null) {
      return Center(
        child: Text(_hasMoreMoviesAndErrorNotifier.errorMessage!),
      );
    } else if (_moviesList.value.isEmpty && !isLoading) {
      return const Center(
        child: Text('No items founded'),
      );
    }
    return child;
  }
}

class _PaginatedLoadingAndErrorValues {
  _PaginatedLoadingAndErrorValues({
    required this.hasMoreMovies,
    required this.error,
  });

  bool hasMoreMovies = true;
  String? error;
}

class _PaginatedHasMoreMoviesAndErrorNotifier
    extends ValueNotifier<_PaginatedLoadingAndErrorValues> {
  _PaginatedHasMoreMoviesAndErrorNotifier(_PaginatedLoadingAndErrorValues value)
      : super(value);
  bool get hasMoreMovies => value.hasMoreMovies;
  void changeHasMoreMovies(bool newValue) {
    value.hasMoreMovies = newValue;
    notifyListeners();
  }

  String? get errorMessage => value.error;
  void changeErrorValue(String? newValue) {
    value.error = newValue;
    notifyListeners();
  }
}
