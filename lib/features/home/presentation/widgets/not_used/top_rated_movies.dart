import 'package:flutter/material.dart';
import '../../../../../config/routes/app_navigator.dart';
import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/container_with_label/container_with_label.dart';
import '../../../../../core/widgets/movie_widget/movie_widget.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/entities/see_all_screen_params.dart';

class TopRatedMoviesList extends StatelessWidget {
  const TopRatedMoviesList({
    super.key,
    required this.topRatedMovies,
    required this.seeAllOnPressedFunction,
  });
  final List<MovieEntity> topRatedMovies;

  final Future<List<MovieEntity>> Function(int page) seeAllOnPressedFunction;
  @override
  Widget build(BuildContext context) {
    return ContainerWithLabel<MovieEntity>(
      labelText: AppStrings.topRated,
      seeAllOnPressed: () {
        AppNavigator.navigateNamedTo(
          context,
          AppRoutes.seeAllScreen,
          arguments: SeeAllScreenParams(
            pageTitle: AppStrings.topRated,
            getMoviesFunc: seeAllOnPressedFunction,
          ),
        );
      },
      generatedListHeight: 0.52,
      generatedList: topRatedMovies,
      itemBuilder: (context, index) => MovieWidget(
        movieEntity: topRatedMovies[index],
        showMoreInfoButton: true,
      ),
    );
  }
}
