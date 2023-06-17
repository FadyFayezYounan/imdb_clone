import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_text_style.dart';
import 'package:movies_app/core/utils/app_values.dart';
import 'package:movies_app/core/widgets/app_divider.dart';
import 'package:movies_app/core/widgets/button_with_icon.dart';
import 'package:movies_app/core/screens/error_screen.dart';
import 'package:movies_app/core/screens/loading_screen.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/home/domain/entities/paginated_screen_params.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity/movie_details_entity.dart';
import 'package:movies_app/features/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/screens/movie_videos_screen.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_cast_list.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_movies_list.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_photos/movie_photos_list.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_trailer_widget.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../../../../config/routes/routes.dart';
import '../cubit/movie_videos_cubit/movie_videos_cubit.dart';
import '../widgets/movie_details_videos_thumbnails/movie_details_videos_thumbnails.dart';
import '../widgets/movie_genres_and_description.dart';
import '../widgets/movie_keywords_list.dart';
import '../widgets/movie_number_of_stars_and_rate_movie_and_language.dart';
import '../widgets/movie_release_year_and_time_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movieVideosCubit});
  final MovieVideosCubit movieVideosCubit;

  @override
  Widget build(BuildContext context) {
    final movieEntity =
        ModalRoute.of(context)!.settings.arguments as MovieEntity;
    final detailsCubit = MovieDetailsCubit.of(context);
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        final movieDetails = detailsCubit.movieDetailsEntity;
        final movieCast = detailsCubit.getMovieCast;
        final similarMovies = detailsCubit.getSimilarMoviesList;
        final recommendedMovies = detailsCubit.getRecommendedMoviesList;
        final moviePhotos = detailsCubit.getMovieImages;
        final keywordsList = detailsCubit.movieKeywordsList;
        if (state is GetMovieDetailsErrorState ||
            movieVideosCubit.state is GetMovieVideosErrorState) {
          return ErrorScreen(onRefresh: () async {
            await Future.wait([
              detailsCubit.getMovieDetailsByIdFunc(id: movieEntity.id),
              movieVideosCubit.getMovieVideosFunc(id: movieEntity.id),
            ]);
          });
        }
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: state is GetMovieDetailsLoadingState ||
                  movieVideosCubit.state is GetMovieVideosLoadingState
              ? const LoadingScreen()
              : RefreshIndicator(
                  onRefresh: () async {
                    await detailsCubit.getMovieDetailsByIdFunc(
                        id: movieEntity.id);
                    await movieVideosCubit.getMovieVideosFunc(
                        id: movieEntity.id);
                  },
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text(movieEntity.title),
                      actions: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert_rounded),
                        )
                      ],
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 24.0,
                              left: AppPadding.padding,
                              right: AppPadding.padding,
                            ),
                            child: Text(
                              movieEntity.title,
                              style: AppTextStyle.headline28White,
                            ),
                          ),
                          MovieReleaseYearAndTimeWidget(
                            movieReleaseYear: movieEntity.releaseDate,
                            movieTime:
                                movieDetails != null ? movieDetails.runtime : 0,
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          if (movieDetails!.backdropPath != null &&
                              movieVideosCubit.movieVideosList.isNotEmpty)
                            MovieTrailerWidget(
                              backdropPath: movieDetails.backdropPath!,
                              movieName: movieDetails.title,
                              movieReleaseDate: movieDetails.releaseDate,
                              onPressed: () {
                                _goToMovieVideoScreen(context, movieDetails);
                              },
                            ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          MovieImageGenresAndDescriptionText(
                            imagePath: movieDetails.posterPath,
                            descriptionText: movieDetails.overview,
                            genresList: movieDetails.genres,
                            onGenresButtonPressed: (index) {
                              _goToPaginatedScreen(context,
                                  screenTitle: movieDetails.genres[index].name,
                                  getMoviesFunc: (page) async {
                                return await detailsCubit
                                    .getMoviesByCategoryIdPaginated(
                                        movieDetails.genres[index].id, page);
                              });
                            },
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          ButtonWithIcon(
                            firstText: 'Add to Watchlist',
                            secondText: 'Added to Watchlist',
                            onPressed: () {},
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          const AppDivider(),
                          const SizedBox(
                            height: 8.0,
                          ),
                          MovieNumberOfStarsRateMovieAndLanguage(
                            starsNumber: movieEntity.voteAverage,
                            voteCount: movieDetails.voteCount,
                          ),
                          const SizedBox(
                            height: 32.0,
                          ),
                          if (movieCast.isNotEmpty)
                            MovieCastList(castList: movieCast),
                          if (recommendedMovies.isNotEmpty)
                            MovieDetailsMoviesList(
                              listTitle: 'Recommended',
                              currentMovieId: movieEntity.id,
                              moviesList: recommendedMovies,
                              paginatedMovies:
                                  detailsCubit.getRecommendedMoviesPaginated,
                            ),
                          if (similarMovies.isNotEmpty)
                            MovieDetailsMoviesList(
                              listTitle: 'More like this',
                              currentMovieId: movieEntity.id,
                              moviesList: similarMovies,
                              paginatedMovies:
                                  detailsCubit.getSimilarMoviesPaginated,
                            ),
                          if (movieVideosCubit.movieVideosList.isNotEmpty)
                            MovieDetailsVideosThumbnails(
                              goToMovieVideoScreen: () {
                                _goToMovieVideoScreen(context, movieDetails);
                              },
                            ),
                          if (moviePhotos.isNotEmpty)
                            MoviePhotosList(
                              moviePhotos: moviePhotos,
                              movieEntity: movieEntity,
                            ),
                          if (keywordsList.isNotEmpty)
                            MovieKeywordsList(
                              listTitle: 'Keywords',
                              currentMovieId: movieEntity.id,
                              keywordsList: keywordsList,
                              onGenresButtonPressed: (index) {
                                _goToPaginatedScreen(
                                  context,
                                  screenTitle: keywordsList[index].name,
                                  getMoviesFunc: (page) async {
                                    return await detailsCubit
                                        .getMoviesByCategoryIdPaginated(
                                            keywordsList[index].id, page);
                                  },
                                );
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }

  Future<dynamic> _goToMovieVideoScreen(
      BuildContext context, MovieDetailsEntity movieDetails) {
    return pushNewScreen(
      context,
      screen: MovieVideosScreen(
        movieId: movieDetails.id,
        movieVideosCubit: movieVideosCubit,
      ),
      withNavBar: false,
    );
  }

  void _goToPaginatedScreen(context,
      {required String screenTitle, required GetMoviesCallBack getMoviesFunc}) {
    AppNavigator.navigateNamedTo(
      context,
      AppRoutes.paginatedScreen,
      arguments: PaginatedScreenParams(
        screenTitle: screenTitle,
        getMoviesFunc: getMoviesFunc,
      ),
    );
  }
}
