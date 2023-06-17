import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/packages_helper/share_helper.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/screens/error_screen.dart';
import '../../../../core/screens/loading_screen.dart';
import '../../../../core/widgets/youtube_player/normal_youtube_player.dart';
import '../cubit/movie_videos_cubit/movie_videos_cubit.dart';
import '../widgets/movie_videos/movie_video_thumbnail_widget.dart';

class MovieVideosScreen extends StatefulWidget {
  const MovieVideosScreen({
    super.key,
    required this.movieId,
    required this.movieVideosCubit,
  });
  final int movieId;
  final MovieVideosCubit movieVideosCubit;

  @override
  State<MovieVideosScreen> createState() => _MovieVideosScreenState();
}

class _MovieVideosScreenState extends State<MovieVideosScreen> {
  //! here i use the Lifting state up pattern to get the value of the
  //! YoutubePlayerController that inside this widget NormalYouTubePlayer
  //! and use it to load new video when the user tap on another video
  YoutubePlayerController? _youtubePlayerController;
  void setController(YoutubePlayerController controller) {
    _youtubePlayerController = controller;
  }

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    // in case of the user press back button when he is in full screen mode.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.movieVideosCubit,
      child: BlocBuilder<MovieVideosCubit, MovieVideosState>(
        builder: (context, state) {
          final movieVideosCubit = context.read<MovieVideosCubit>();
          if (state is GetMovieVideosLoadingState) {
            return const LoadingScreen();
          } else if (state is GetMovieVideosErrorState) {
            return const ErrorScreen();
          }
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  if (movieVideosCubit.selectedMovieVideo != null)
                    Expanded(
                      flex: 4,
                      child: NormalYoutubePlayer(
                        youTubeUrl: movieVideosCubit.selectedMovieVideo!.key,
                        titleText: movieVideosCubit.selectedMovieVideo!.type,
                        subtitleText: movieVideosCubit.selectedMovieVideo!.name,
                        autoPlay: true,
                        loop: true,
                        onControllerSet: setController,
                        onShareButtonPressed: () {
                          ShareHelper.shareText(
                            text: movieVideosCubit.selectedMovieVideo!.name,
                            linkUrl:
                                'https://www.themoviedb.org/movie/${widget.movieId}/videos',
                          );
                        },
                      ),
                    ),
                  //if (orientation == Orientation.portrait)
                  if (context.isPortrait)
                    Container(
                      padding: const EdgeInsets.only(left: 16.0),
                      width: 1.sw,
                      height: 48.0,
                      color: AppColors.containerColor,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'PLAYLIST',
                        style: AppTextStyle.body16White,
                      ),
                    ),
                  if (context.isPortrait)
                    Expanded(
                      flex: 7,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          final video = movieVideosCubit.movieVideosList[index];
                          return MovieVideoThumbnailWidget(
                            isSelected:
                                video == movieVideosCubit.selectedMovieVideo,
                            youTubeUrl: video.key,
                            titleText: video.name,
                            subtitleText: video.type,
                            videoSize: video.size,
                            onPressed: () async {
                              if (movieVideosCubit.isSameVideo(video)) return;
                              movieVideosCubit.setSelectedMovieVideo = video;
                              _youtubePlayerController?.load(video.key);
                            },
                          );
                        },
                        itemCount: movieVideosCubit.movieVideosList.length,
                      ),
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
