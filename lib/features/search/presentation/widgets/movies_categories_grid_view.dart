import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/utils.dart';
import 'package:movies_app/features/search/presentation/cubit/search_cubit.dart';

import '../../../../config/routes/app_navigator.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../home/domain/entities/see_all_screen_params.dart';
import '../../../movie_details/domain/entities/movie_details_entity/genre_entity.dart';
import 'genre_widget/genre_widget.dart';

class MoviesCategoriesGridView extends StatelessWidget {
  const MoviesCategoriesGridView({
    super.key,
    required this.allMoviesGenresList,
  });
  final List<GenreEntity> allMoviesGenresList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      shrinkWrap: true,
      primary: false,
      itemCount: allMoviesGenresList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.isPortrait ? 2 : 4,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 24.0,
        //childAspectRatio: 16 / 16,
      ),
      itemBuilder: (context, index) => GenreWidget(
        genreEntity: allMoviesGenresList[index],
        onPressed: () async {
          AppNavigator.navigateNamedTo(
            context,
            AppRoutes.seeAllScreen,
            arguments: SeeAllScreenParams(
              pageTitle: allMoviesGenresList[index].name,
              getMoviesFunc: (page) async {
                return await BlocProvider.of<SearchCubit>(context)
                    .getMoviesByCategoryIdPaginated(
                  allMoviesGenresList[index].id,
                  page,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
