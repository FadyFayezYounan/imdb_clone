import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/screens/animated_loading.dart';
import 'package:movies_app/core/screens/error_screen.dart';
import 'package:movies_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:movies_app/features/home/presentation/widgets/home_movies_list.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/main_movies/main_movies_carousel_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = HomeCubit.of(context);
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previousState, state) {
          return state is GetHomeScreenMoviesLoadingState ||
              state is GetHomeScreenMoviesSuccessState ||
              state is GetHomeScreenMoviesErrorState;
        },
        builder: (context, state) {
          if (state is GetHomeScreenMoviesErrorState) {
            return ErrorScreen(
              onRefresh: homeCubit.getHomeScreenMovies,
            );
          }
          return AnimatedLoading(
            isLoading: state is GetHomeScreenMoviesLoadingState,
            child: RefreshIndicator(
              onRefresh: homeCubit.getHomeScreenMovies,
              child: ListView(
                children: [
                  MainMoviesCarouselListWidget(
                    nowPlayingMoviesList: homeCubit.getNowPlayingMovies,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  HomeMoviesList(
                    listTitle: AppStrings.topPicks,
                    listMovies: homeCubit.getPopularMovies,
                    paginatedMovies: homeCubit.getPopularMoviesPaginated,
                  ),
                  HomeMoviesList(
                    listTitle: AppStrings.topRated,
                    listMovies: homeCubit.getTopRatedMovies,
                    paginatedMovies: homeCubit.getTopRatedMoviesPaginated,
                  ),
                  HomeMoviesList(
                    listTitle: AppStrings.upcoming,
                    listMovies: homeCubit.getUpcomingMovies,
                    paginatedMovies: homeCubit.getUpcomingMoviesPaginated,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
