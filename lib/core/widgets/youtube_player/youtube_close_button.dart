import 'package:flutter/material.dart';
import 'package:movies_app/config/routes/app_navigator.dart';
import 'package:movies_app/core/widgets/youtube_player/youtube_icon_button.dart';

class YoutubeCloseButton extends StatelessWidget {
  const YoutubeCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return YoutubeIconButton(
      icon: Icons.close_rounded,
      onPressed: () {
        AppNavigator.pop(context);
      },
    );
  }
}
