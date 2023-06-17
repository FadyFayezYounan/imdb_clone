import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_videos/video_thumbnail_image.dart';

import '../../../../../core/utils/utils.dart';

class MovieVideoThumbnailWidget extends StatelessWidget {
  const MovieVideoThumbnailWidget({
    super.key,
    required this.youTubeUrl,
    required this.titleText,
    required this.subtitleText,
    required this.isSelected,
    required this.onPressed,
    required this.videoSize,
  });
  final String youTubeUrl;
  final String titleText;
  final String subtitleText;
  final bool isSelected;
  final int videoSize;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: context.isPortrait ? 0.16.sh : 0.32.sh,
        color: isSelected ? AppColors.containerColor : null,
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: MovieVideoThumbnailImage(
                youTubeUrl: youTubeUrl,
                videoSize: videoSize,
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    titleText,
                    style: AppTextStyle.body16White,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    subtitleText,
                    style: AppTextStyle.label14Grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
