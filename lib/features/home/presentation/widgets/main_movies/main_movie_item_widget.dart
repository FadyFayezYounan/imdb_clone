import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/add_to_watch_list_clipped_button.dart';
import 'package:movies_app/core/widgets/movie_widget/movie_image.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import '../../../../../core/utils/utils.dart';
import 'main_movie_trailer.dart';

class MainMovieItemWidget extends StatelessWidget {
  const MainMovieItemWidget({
    super.key,
    required this.currentMovie,
    required this.onPlayPressed,
  });
  final MovieEntity currentMovie;
  final VoidCallback onPlayPressed;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.scaffoldBackgroundColor,
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
          final maxWidth = boxConstraints.maxWidth;
          final maxHeight = boxConstraints.maxHeight;
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              MainMovieTrailer(
                imageUrl: currentMovie.backdropPath,
                imageWidth: maxWidth,
                imageHeight: maxHeight * 0.84,
                onPlayPressed: onPlayPressed,
              ),
              Positioned(
                bottom: 0,
                left: maxWidth * 0.03,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (currentMovie.posterPath != null)
                      _buildMovieImageWidget(
                        context: context,
                        maxWidth: maxWidth,
                        maxHeight: maxHeight,
                        movieImage: currentMovie.posterPath!,
                      ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: maxWidth * 0.03),
                      child: SizedBox(
                        width: maxWidth * 0.64,
                        child: _MovieTitleAndSubTextWidget(
                          movieTitle: currentMovie.title,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Stack _buildMovieImageWidget({
    required BuildContext context,
    required double maxWidth,
    required double maxHeight,
    required String movieImage,
  }) {
    return Stack(
      children: [
        MovieImage(
          width: context.isPortrait ? maxWidth * 0.3 : maxWidth * 0.15,
          height: maxHeight * 0.58,
          movieImage: AppConstants.showMoviesImage(movieImage),
          topLeftAndRightRadius: 0.0,
        ),
        AddToWatchListClippedButton(
          width: maxWidth * 0.1,
          height: maxHeight * 0.16,
          onPressed: () {},
          hideBorderRadius: true,
        ),
      ],
    );
  }
}

class _MovieTitleAndSubTextWidget extends StatelessWidget {
  const _MovieTitleAndSubTextWidget({
    Key? key,
    required this.movieTitle,
  }) : super(key: key);
  final String movieTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          movieTitle,
          style: AppTextStyle.title18White,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 2.0,
        ),
        Text(
          'Official Trailer',
          style: AppTextStyle.label14Grey,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
