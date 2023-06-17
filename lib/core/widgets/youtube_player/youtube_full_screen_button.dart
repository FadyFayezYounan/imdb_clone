import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/core/widgets/youtube_player/youtube_icon_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerFullScreenButton extends StatefulWidget {
  const YoutubePlayerFullScreenButton({
    super.key,
    required this.controller,
  });

  final YoutubePlayerController controller;

  @override
  State<YoutubePlayerFullScreenButton> createState() =>
      _YoutubePlayerFullScreenButtonState();
}

class _YoutubePlayerFullScreenButtonState
    extends State<YoutubePlayerFullScreenButton> {
  late YoutubePlayerController _controller;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _controller = widget.controller;
    _controller.removeListener(listener);
    _controller.addListener(listener);
  }

  @override
  void dispose() {
    _controller.removeListener(listener);

    super.dispose();
  }

  void listener() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return YoutubeIconButton(
      icon: _controller.value.isFullScreen
          ? Icons.close_fullscreen_rounded
          : Icons.open_in_full_rounded,
      onPressed: _toggleFullScreenMode,
    );
  }

  void _toggleFullScreenMode() {
    _updateYoutubeFullScreenValue();
    if (_controller.value.isFullScreen) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]).then((_) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      });
    }
  }

  void _updateYoutubeFullScreenValue({bool? isFullScreen}) {
    _controller.updateValue(_controller.value.copyWith(
        isFullScreen: isFullScreen ?? !_controller.value.isFullScreen));
  }
  // void _toggleFullScreenMode() {
  //   // if (!context.isPortrait) {
  //   //   _controller.updateValue(_controller.value.copyWith(isFullScreen: true));
  //   // } else {
  //   //   _controller.updateValue(_controller.value
  //   //       .copyWith(isFullScreen: !_controller.value.isFullScreen));
  //   // }
  //   _controller.updateValue(_controller.value
  //       .copyWith(isFullScreen: !_controller.value.isFullScreen));

  //   if (_controller.value.isFullScreen) {
  //     SystemChrome.setPreferredOrientations([
  //       DeviceOrientation.landscapeLeft,
  //       DeviceOrientation.landscapeRight,
  //     ]);
  //   } else {
  //     SystemChrome.setPreferredOrientations([
  //       DeviceOrientation.portraitUp,
  //       // DeviceOrientation.landscapeLeft,
  //       // DeviceOrientation.landscapeRight,
  //     ]);
  //   }
  // }
}
// import 'package:flutter/material.dart';
// import 'package:movies_app/core/widgets/youtube_player/youtube_icon_button.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class YoutubePlayerFullScreenButton extends StatefulWidget {
//   const YoutubePlayerFullScreenButton({super.key, required this.controller});

//   final YoutubePlayerController controller;
//   @override
//   State<YoutubePlayerFullScreenButton> createState() =>
//       _YoutubePlayerFullScreenButtonState();
// }

// class _YoutubePlayerFullScreenButtonState
//     extends State<YoutubePlayerFullScreenButton> {
//   late YoutubePlayerController _controller;
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();

//     _controller = widget.controller;
//     _controller.removeListener(listener);
//     _controller.addListener(listener);
//   }

//   @override
//   void dispose() {
//     _controller.removeListener(listener);
//     super.dispose();
//   }

//   void listener() {
//     if (mounted) setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return YoutubeIconButton(
//       icon: _controller.value.isFullScreen
//           ? Icons.close_fullscreen_rounded
//           : Icons.open_in_full_rounded,
//       onPressed: () => _controller.toggleFullScreenMode(),
//     );
//   }
// }
