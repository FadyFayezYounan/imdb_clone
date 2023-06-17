import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/youtube_player/youtube_icon_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeReplay10SecondsButton extends StatelessWidget {
  const YoutubeReplay10SecondsButton({
    super.key,
    required this.controller,
  });

  final YoutubePlayerController controller;

  @override
  Widget build(BuildContext context) {
    return YoutubeIconButton(
      icon: Icons.replay_10_rounded,
      onPressed: () {
        controller.seekTo(
          Duration(
            seconds: controller.value.position.inSeconds - 10,
          ),
        );
      },
    );
  }
}
