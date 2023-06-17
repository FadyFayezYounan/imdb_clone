import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/youtube_player/youtube_icon_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeMuteButton extends StatefulWidget {
  const YoutubeMuteButton({
    super.key,
    required this.controller,
  });
  final YoutubePlayerController controller;

  @override
  State<YoutubeMuteButton> createState() => _YoutubeMuteButtonState();
}

class _YoutubeMuteButtonState extends State<YoutubeMuteButton> {
  bool _isMuted = false;
  @override
  Widget build(BuildContext context) {
    return YoutubeIconButton(
      icon: _isMuted ? Icons.volume_mute_rounded : Icons.volume_up_rounded,
      onPressed: () {
        _isMuted ? widget.controller.unMute() : widget.controller.mute();
        setState(() {
          _isMuted = !_isMuted;
        });
      },
    );
  }
}
