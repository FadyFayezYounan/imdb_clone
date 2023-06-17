import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text_style.dart';
import 'package:movies_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:movies_app/features/search/presentation/screens/search_results_screen.dart';

import 'package:animations/animations.dart';
import '../widgets/movies_categories_grid_view.dart';
import '../widgets/search_results/search_bar_button.dart';

class SearchScreenWithCategories extends StatefulWidget {
  const SearchScreenWithCategories({super.key});

  @override
  State<SearchScreenWithCategories> createState() =>
      _SearchScreenWithCategoriesState();
}

class _SearchScreenWithCategoriesState
    extends State<SearchScreenWithCategories> {
  @override
  void initState() {
    super.initState();
    _getAllMoviesGenres();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _getAllMoviesGenres() async {
    await BlocProvider.of<SearchCubit>(context).getAllMoviesGenresFunc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: OpenContainer(
          closedElevation: 0.0,
          openElevation: 0.0,
          closedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          openShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),

          transitionType: ContainerTransitionType.fadeThrough,
          closedColor: AppColors.scaffoldBackgroundColor,
          openColor: AppColors.scaffoldBackgroundColor,
          //transitionDuration: Duration(seconds: 3),
          closedBuilder: (context, openSearchResultScreen) => SearchBarButton(
            onSearchBarButtonPressed: openSearchResultScreen,
          ),
          openBuilder: (context, action) => const SearchResultsScreen(),
        ),
      ),
      body: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final searchCubit = context.read<SearchCubit>();
          // final allMoviesGenresList =
          //     context.read<SearchCubit>().allMoviesGenres;
          if (state is GetAllMoviesGenresErrorState) {}
          if (state is GetAllMoviesGenresLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return ListView(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 16.0,
            ),
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.theaters_rounded,
                    color: AppColors.primaryColor,
                    size: 38.0,
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Text(
                    'Movies',
                    style: AppTextStyle.headline24White,
                  ),
                ],
              ),
              const SizedBox(
                height: 32.0,
              ),
              MoviesCategoriesGridView(
                allMoviesGenresList: searchCubit.allMoviesGenres,
              ),
            ],
          );
        },
      ),
    );
  }
}
