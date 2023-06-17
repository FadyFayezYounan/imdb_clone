import 'package:flutter/material.dart';
import '../../../../../config/routes/app_navigator.dart';
import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/container_with_label/container_with_label.dart';
import '../../../../../core/widgets/movie_widget/movie_widget.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/entities/see_all_screen_params.dart';

class PopularMoviesList extends StatelessWidget {
  const PopularMoviesList({
    super.key,
    required this.popularMovies,
    required this.seeAllOnPressedFunction,
  });
  final List<MovieEntity> popularMovies;

  final Future<List<MovieEntity>> Function(int page) seeAllOnPressedFunction;
  @override
  Widget build(BuildContext context) {
    return ContainerWithLabel<MovieEntity>(
      labelText: AppStrings.topPicks,
      seeAllOnPressed: () {
        AppNavigator.navigateNamedTo(
          context,
          AppRoutes.seeAllScreen,
          arguments: SeeAllScreenParams(
            pageTitle: AppStrings.topPicks,
            getMoviesFunc: seeAllOnPressedFunction,
          ),
        );
      },
      generatedListHeight: 0.52,
      generatedList: popularMovies,
      itemBuilder: (context, index) => MovieWidget(
        movieEntity: popularMovies[index],
        showMoreInfoButton: true,
      ),
    );
  }
}
