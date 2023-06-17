import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/routes/app_navigator.dart';
import 'package:movies_app/config/routes/app_routes.dart';
import 'package:movies_app/core/utils/utils.dart';
import 'package:movies_app/core/widgets/add_to_watch_list_clipped_button.dart';
import 'package:movies_app/core/widgets/movie_widget/movie_release_date_widget.dart';
import 'package:movies_app/core/widgets/movie_widget/movie_title_widget.dart';
import 'package:movies_app/core/widgets/movie_widget/show_movie_more_info_in_model_sheet.dart';
import 'package:movies_app/core/widgets/movie_widget/watch_list_button_widget.dart';
import '../../../features/home/domain/entities/movie_entity.dart';
import 'movie_image.dart';
import 'movie_more_info_button_widget.dart';
import 'movie_stars_number_widget.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({
    super.key,
    required this.movieEntity,
    this.showMoreInfoButton = true,
    this.showAddToWatchListButton = true,
  });

  final MovieEntity movieEntity;

  final bool showMoreInfoButton;
  final bool showAddToWatchListButton;
  @override
  Widget build(BuildContext context) {
    final appOrientation = MediaQuery.of(context).orientation;
    return InkWell(
      onTap: () {
        AppNavigator.navigateNamedTo(
          context,
          AppRoutes.movieDetailsScreen,
          arguments: movieEntity,
        );
      },
      child: Container(
        width: appOrientation == Orientation.portrait ? 0.36.sw : 0.18.sw,
        margin: const EdgeInsets.only(
          right: 8.0,
          bottom: 8.0,
        ),
        decoration: BoxDecoration(
          color: AppColors.movieCardColor,
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadowColor,
              spreadRadius: 0.0,
              blurRadius: 16.0,
              offset: Offset(4.0, 8.0),
              blurStyle: BlurStyle.inner,
            ),
          ],
        ),
        child: LayoutBuilder(
          builder: (context, boxConstraints) {
            final maxWidth = boxConstraints.maxWidth;
            final maxHeight = boxConstraints.maxHeight;
            return Stack(
              alignment: Alignment.topLeft,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    movieEntity.posterPath != null
                        ? MovieImage(
                            width: maxWidth,
                            height: maxHeight * 0.56,
                            movieImage: movieEntity.posterPath!,
                          )
                        : PlaceHolderImage(
                            maxWidth: maxWidth,
                            maxHeight: maxHeight,
                          ),
                    MovieStarsNumberWidget(
                      starsNumber: movieEntity.voteAverage,
                    ),
                    MovieTitleWidget(
                      title: movieEntity.title,
                    ),
                    const Spacer(),
                    if (movieEntity.releaseDate != null &&
                        showAddToWatchListButton)
                      MovieReleaseDateWidget(
                        releaseDate: movieEntity.releaseDate!,
                      ),
                    if (showAddToWatchListButton) const WatchListButtonWidget(),
                    if (showMoreInfoButton)
                      MovieMoreInfoButtonWidget(
                        onPressed: () async {
                          await showMovieMoreInfoInModelSheet(
                            context,
                            movieEntity,
                          );
                        },
                      ),
                  ],
                ),
                AddToWatchListClippedButton(
                  width: maxWidth * 0.3,
                  height: maxHeight * 0.14,
                  onPressed: () {},
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class PlaceHolderImage extends StatelessWidget {
  const PlaceHolderImage({
    super.key,
    required this.maxWidth,
    required this.maxHeight,
  });

  final double maxWidth;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: maxWidth,
      height: maxHeight * 0.5,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.movieCardColor,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(10),
          right: Radius.circular(10),
        ),
      ),
      child: const Icon(
        Icons.theaters_rounded,
        size: 48.0,
        color: Colors.grey,
      ),
    );
  }
}
