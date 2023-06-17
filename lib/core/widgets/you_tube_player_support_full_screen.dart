import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubePlayerSupportFullScreen extends StatefulWidget {
  const YouTubePlayerSupportFullScreen({
    super.key,
    required this.youTubeUrl,
    required this.builder,
  });
  final String youTubeUrl;

  final Widget Function(BuildContext context, Widget player) builder;
  @override
  State<YouTubePlayerSupportFullScreen> createState() =>
      _YouTubePlayerSupportFullScreenState();
}

class _YouTubePlayerSupportFullScreenState
    extends State<YouTubePlayerSupportFullScreen> {
  late YoutubePlayerController _youtubePlayerController;
  @override
  void initState() {
    super.initState();
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: widget.youTubeUrl,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: true,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _youtubePlayerController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        // The player forces portraitUp after exiting fullscreen. This overrides the behavior.
        //SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _youtubePlayerController,
        bottomActions: [
          CurrentPosition(),
          const SizedBox(width: 10.0),
          ProgressBar(
            isExpanded: true,
            colors: const ProgressBarColors(
              playedColor: AppColors.primaryColor,
              handleColor: AppColors.primaryColor,
            ),
          ),
          const SizedBox(width: 10.0),
          RemainingDuration(),
          FullScreenButton(),
        ],
        width: 1.sw,
      ),
      builder: widget.builder,
    );
  }
}
