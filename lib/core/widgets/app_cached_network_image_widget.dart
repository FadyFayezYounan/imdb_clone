import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text_style.dart';

class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.borderRadius,
    this.loadingIcon,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadiusGeometry? borderRadius;
  final IconData? loadingIcon;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(0.0),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        placeholder: loadingIcon == null
            ? null
            : (context, url) {
                return Center(
                  child: Icon(
                    loadingIcon,
                    //Icons.theaters_rounded
                    color: Colors.grey,
                    size: width != null ? (width! * 0.67) : 32.0,
                  ),
                );
              },
        errorWidget: (context, url, error) {
          return Column(
            children: [
              const Icon(
                Icons.error_rounded,
                color: AppColors.errorColor,
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                'something went wrong!',
                style: AppTextStyle.label14Grey.copyWith(
                  color: AppColors.errorColor,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
