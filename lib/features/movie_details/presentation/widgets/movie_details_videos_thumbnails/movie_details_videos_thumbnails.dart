import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/movie_details/presentation/cubit/movie_videos_cubit/movie_videos_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/app_cached_network_image_widget.dart';
import '../../../../../core/widgets/bottom_shadow_widget.dart';
import '../../../../../core/widgets/container_with_label/see_all_blue_button.dart';
import '../../../../../core/widgets/container_with_label/yellow_divider.dart';
import 'movie_thumbnail_widget.dart';

class MovieDetailsVideosThumbnails extends StatelessWidget {
  const MovieDetailsVideosThumbnails(
      {super.key, required this.goToMovieVideoScreen});
  final VoidCallback goToMovieVideoScreen;

  @override
  Widget build(BuildContext context) {
    final movieVideosList =
        BlocProvider.of<MovieVideosCubit>(context).movieVideosList;
    return Container(
      padding: const EdgeInsets.all(AppPadding.padding),
      decoration: const BoxDecoration(
        color: AppColors.containerColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            spreadRadius: 8.0,
            blurRadius: 16.0,
          ),
        ],
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const YellowDivider(),
                Text(
                  'Videos',
                  style: AppTextStyle.headline20White,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  movieVideosList.length.toString(),
                  style: AppTextStyle.label14Grey,
                ),
                const Spacer(),
                SeeAllBlueButton(seeAllOnPressed: goToMovieVideoScreen),
              ],
            ),
          ),
          const SizedBox(
            height: 32.0,
          ),
          GestureDetector(
            onTap: () {
              BlocProvider.of<MovieVideosCubit>(context).setSelectedMovieVideo =
                  movieVideosList.first;
              goToMovieVideoScreen();
            },
            child: Stack(
              children: [
                BottomShadowWidget(
                  bottomRadius: 12.0,
                  child: AppCachedNetworkImage(
                    imageUrl: YoutubePlayer.getThumbnail(
                        videoId: movieVideosList.first.key),
                    fit: BoxFit.cover,
                    width: 1.sw,
                    borderRadius: BorderRadius.circular(12.0),
                    height: context.isPortrait ? 0.28.sh : 0.56.sh,
                  ),
                ),
                Positioned(
                  bottom: 16.0,
                  left: 16.0,
                  child: Wrap(
                    runSpacing: 4.0,
                    spacing: 4.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Icon(
                        Icons.play_circle_outline_rounded,
                        size: 20.0,
                      ),
                      Text(
                        movieVideosList.first.type,
                        style: AppTextStyle.body12White,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          BlocBuilder<MovieVideosCubit, MovieVideosState>(
            builder: (context, state) {
              final movieVideosCubit = context.read<MovieVideosCubit>();
              return SizedBox(
                width: 1.sw,
                height: context.isPortrait ? 0.18.sh : 0.36.sh,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final video = movieVideosCubit
                        .movieVideosListWithoutFirstVideo[index];
                    return MovieDetailsVideoThumbnailWidget(
                      movieVideoEntity: video,
                      onPressed: () {
                        movieVideosCubit.setSelectedMovieVideo = video;
                        goToMovieVideoScreen();
                      },
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8.0),
                  itemCount:
                      movieVideosCubit.movieVideosListWithoutFirstVideo.length,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
