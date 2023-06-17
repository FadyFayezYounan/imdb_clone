import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';
import '../app_cached_network_image_widget.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({
    Key? key,
    required this.width,
    required this.height,
    required this.movieImage,
    this.topLeftAndRightRadius = 10.0,
  }) : super(key: key);

  final double width;
  final double height;
  final String movieImage;
  final double topLeftAndRightRadius;

  @override
  Widget build(BuildContext context) {
    return AppCachedNetworkImage(
      width: width,
      height: height,
      loadingIcon: Icons.theaters_rounded,
      imageUrl: AppConstants.showMoviesImage(movieImage),
      fit: BoxFit.cover,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeftAndRightRadius),
        topRight: Radius.circular(topLeftAndRightRadius),
      ),
    );
  }
}
