import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/utils.dart';

import '../app_cached_network_image_widget.dart';

class CastImage extends StatelessWidget {
  const CastImage({
    super.key,
    required this.width,
    required this.height,
    required this.castImage,
    this.gender,
  });
  final double width;
  final double height;
  final String? castImage;
  final int? gender;

  @override
  Widget build(BuildContext context) {
    return castImage == null
        ? _buildNotFoundCastImage()
        : AppCachedNetworkImage(
            loadingIcon: Icons.person_rounded,
            width: width,
            height: height,
            imageUrl: AppConstants.showMoviesImage(castImage!),
            fit: BoxFit.cover,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          );
  }

  Widget _buildNotFoundCastImage() {
    String image = AppImages.womanPlaceholder;
    if (gender == 2 || gender == null) {
      image = AppImages.manPlaceholder;
    }
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        width: width,
        height: height,
      ),
    );
  }
}
