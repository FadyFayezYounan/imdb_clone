import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/utils.dart';
import 'package:movies_app/core/widgets/youtube_player/youtube_close_button.dart';
import 'package:movies_app/core/widgets/youtube_player/youtube_share_button.dart';
import 'package:movies_app/core/widgets/youtube_player/youtube_total_duration_text.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'youtube_full_screen_button.dart';
import 'youtube_mute_button.dart';
import 'youtube_replay_10_seconds_button.dart';

class NormalYoutubePlayer extends StatefulWidget {
  const NormalYoutubePlayer({
    super.key,
    required this.youTubeUrl,
    this.titleText,
    this.subtitleText,
    this.mute = false,
    this.autoPlay = false,
    this.loop = false,
    this.enableCaption = false,
    this.hideControls = false,
    this.hideThumbnail = false,
    this.controlsVisibleAtStart = false,
    this.onControllerSet,
    this.onShareButtonPressed,
  });
  final String youTubeUrl;
  final String? titleText;
  final String? subtitleText;
  final bool mute;
  final bool autoPlay;
  final bool loop;
  final bool enableCaption;
  final bool hideControls;
  final bool hideThumbnail;
  final bool controlsVisibleAtStart;
  final VoidCallback? onShareButtonPressed;
  final Function(YoutubePlayerController controller)? onControllerSet;

  @override
  State<NormalYoutubePlayer> createState() => _NormalYoutubePlayerState();
}

class _NormalYoutubePlayerState extends State<NormalYoutubePlayer> {
  late YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    super.initState();
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: widget.youTubeUrl,
      flags: YoutubePlayerFlags(
        mute: widget.mute,
        controlsVisibleAtStart: widget.controlsVisibleAtStart,
        autoPlay: widget.autoPlay,
        disableDragSeek: false,
        loop: widget.loop,
        isLive: false,
        forceHD: false,
        enableCaption: widget.enableCaption,
        hideControls: widget.hideControls,
        hideThumbnail: widget.hideThumbnail,
        useHybridComposition: true,
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
    if (widget.onControllerSet != null) {
      widget.onControllerSet!(_youtubePlayerController);
    }

    return YoutubePlayer(
      controller: _youtubePlayerController,
      progressIndicatorColor: AppColors.primaryColor,
      showVideoProgressIndicator: true,
      progressColors: const ProgressBarColors(
        playedColor: AppColors.primaryColor,
        handleColor: AppColors.primaryColor,
      ),
      topActions: [
        const YoutubeCloseButton(),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.titleText != null)
                Text(
                  widget.titleText!,
                  style: AppTextStyle.title14WhiteBold,
                ),
              if (widget.subtitleText != null)
                Text(
                  widget.subtitleText!,
                  style: AppTextStyle.label14Grey,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
        ),
        if (widget.onShareButtonPressed != null)
          YoutubeShareButton(
            onPressed: widget.onShareButtonPressed!,
          ),
      ],
      bottomActions: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ProgressBar(
                colors: const ProgressBarColors(
                  playedColor: AppColors.primaryColor,
                  handleColor: AppColors.primaryColor,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      YoutubeReplay10SecondsButton(
                        controller: _youtubePlayerController,
                      ),
                      YoutubeMuteButton(
                        controller: _youtubePlayerController,
                      ),
                      CurrentPosition(),
                      const Text(' / '),
                      YoutubeTotalDuration(
                        controller: _youtubePlayerController,
                      ),
                    ],
                  ),
                  YoutubePlayerFullScreenButton(
                    controller: _youtubePlayerController,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
