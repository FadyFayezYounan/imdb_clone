import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_navigator.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/widgets/container_with_label/container_with_label.dart';
import '../../../../core/widgets/movie_widget/movie_widget.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../../../home/domain/entities/paginated_screen_params.dart';

class MovieDetailsMoviesList extends StatelessWidget {
  const MovieDetailsMoviesList({
    super.key,
    required this.listTitle,
    required this.currentMovieId,
    required this.moviesList,
    required this.paginatedMovies,
  });
  final String listTitle;
  final int currentMovieId;
  final List<MovieEntity> moviesList;
  final Future<Either<Failure, List<MovieEntity>>> Function(
    int movieId,
    int page,
  ) paginatedMovies;
  @override
  Widget build(BuildContext context) {
    return ContainerWithLabel<MovieEntity>(
      labelText: listTitle,
      seeAllOnPressed: () {
        AppNavigator.navigateNamedTo(
          context,
          AppRoutes.paginatedScreen,
          arguments: PaginatedScreenParams(
            screenTitle: listTitle,
            getMoviesFunc: (page) async {
              return await paginatedMovies(
                currentMovieId,
                page,
              );
            },
          ),
        );
      },
      generatedList: moviesList,
      itemBuilder: (context, index) => MovieWidget(
        movieEntity: moviesList[index],
        showMoreInfoButton: false,
      ),
    );
  }
}
