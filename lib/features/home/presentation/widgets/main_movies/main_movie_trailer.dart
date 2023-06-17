import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_constants.dart';

import '../../../../../core/widgets/app_cached_network_image_widget.dart';
import '../../../../movie_details/presentation/widgets/movie_trailer_widget.dart';

class MainMovieTrailer extends StatelessWidget {
  const MainMovieTrailer({
    super.key,
    required this.imageUrl,
    required this.imageWidth,
    required this.imageHeight,
    required this.onPlayPressed,
  });
  final String? imageUrl;
  final double imageWidth;
  final double imageHeight;
  final VoidCallback onPlayPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (imageUrl != null)
          AppCachedNetworkImage(
            imageUrl: AppConstants.showMoviesImage(imageUrl!),
            width: imageWidth,
            height: imageHeight,
            fit: BoxFit.cover,
          ),
        Container(
          width: imageWidth,
          height: imageHeight,
          color: imageUrl != null ? Colors.black54 : Colors.black,
        ),
        if (imageUrl != null)
          PlayTrailerButton(
            onPlayPressed: onPlayPressed,
            size: 46,
          ),
      ],
    );
  }
}
