import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/youtube_player/youtube_icon_button.dart';

class YoutubeShareButton extends StatelessWidget {
  const YoutubeShareButton({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return YoutubeIconButton(
      icon: Icons.share_rounded,
      onPressed: onPressed,
    );
  }
}
