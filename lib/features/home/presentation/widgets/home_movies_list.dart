import 'package:flutter/material.dart';
import '../../../../config/routes/app_navigator.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/widgets/labeled_horizontal_list/labeled_horizontal_list.dart';
import '../../../../core/widgets/movie_widget/movie_widget.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/entities/paginated_screen_params.dart';

typedef SeeAllButtonCallback = Future<List<MovieEntity>> Function(int page);

class HomeMoviesList extends StatelessWidget {
  /// create  horizontal list of movies.
  ///
  /// [listTitle] is the title for the container and see all screen.
  ///
  /// [listMovies] is the list that will be generated inside the container.
  ///
  /// [paginatedMovies] this function is used to get the movies when the user pressed on see all button.
  const HomeMoviesList({
    super.key,
    required this.listTitle,
    required this.listMovies,
    required this.paginatedMovies,
  });
  final String listTitle;
  final List<MovieEntity> listMovies;
  final GetMoviesCallBack paginatedMovies;

  @override
  Widget build(BuildContext context) {
    return LabeledHorizontalList<MovieEntity>(
      labelText: listTitle,
      seeAllOnPressed: () {
        AppNavigator.navigateNamedTo(
          context,
          AppRoutes.paginatedScreen,
          arguments: PaginatedScreenParams(
            screenTitle: listTitle,
            getMoviesFunc: paginatedMovies,
          ),
        );
      },
      generatedListHeight: 0.56,
      generatedList: listMovies,
      itemBuilder: (context, index) => MovieWidget(
        movieEntity: listMovies[index],
        showMoreInfoButton: true,
      ),
    );
  }
}
