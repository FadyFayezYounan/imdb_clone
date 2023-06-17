import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/utils.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../core/widgets/app_cached_network_image_widget.dart';
import '../../../../../core/widgets/bottom_shadow_widget.dart';

class MovieVideoThumbnailImage extends StatelessWidget {
  const MovieVideoThumbnailImage({
    super.key,
    required this.youTubeUrl,
    required this.videoSize,
  });

  final String youTubeUrl;
  final int videoSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BottomShadowWidget(
          child: AppCachedNetworkImage(
            imageUrl: YoutubePlayer.getThumbnail(videoId: youTubeUrl),
            fit: BoxFit.cover,
            width: 1.sw,
            height: context.isPortrait ? 0.16.sh : 0.32.sh,
          ),
        ),
        _buildVideoSizeText(),
      ],
    );
  }

  Positioned _buildVideoSizeText() {
    return Positioned(
      bottom: 12.0,
      left: 12.0,
      child: Row(
        children: [
          const Icon(
            Icons.play_circle_outline_rounded,
          ),
          Text(' ${videoSize}p'),
        ],
      ),
    );
  }
}
