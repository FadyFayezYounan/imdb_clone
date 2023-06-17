import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_extensions.dart';
import 'package:movies_app/core/utils/app_text_style.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/app_cached_network_image_widget.dart';
import '../../../../../core/widgets/bottom_shadow_widget.dart';
import '../../../domain/entities/movie_videos_entity/movie_video_entity.dart';

class MovieDetailsVideoThumbnailWidget extends StatelessWidget {
  const MovieDetailsVideoThumbnailWidget({
    super.key,
    required this.movieVideoEntity,
    required this.onPressed,
  });
  final MovieVideoEntity movieVideoEntity;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: context.isPortrait ? 0.36.sw : 0.18.sw,
        decoration: const BoxDecoration(
          color: AppColors.movieCardColor,
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              spreadRadius: 0.0,
              blurRadius: 16.0,
              offset: Offset(4.0, 8.0),
              blurStyle: BlurStyle.inner,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  BottomShadowWidget(
                    child: AppCachedNetworkImage(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                      imageUrl: YoutubePlayer.getThumbnail(
                          videoId: movieVideoEntity.key),
                      fit: BoxFit.cover,
                      width: 1.sw,
                      //height: context.isPortrait ? 0.2.sh : 0.44.sh,
                    ),
                  ),
                  Positioned(
                    bottom: 8.0,
                    left: 8.0,
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
                          movieVideoEntity.type,
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
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  movieVideoEntity.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
