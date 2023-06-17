import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/app_cached_network_image_widget.dart';

class MovieTrailerWidget extends StatelessWidget {
  const MovieTrailerWidget({
    super.key,
    required this.backdropPath,
    this.movieName,
    this.movieReleaseDate,
    this.showMovieInfoText = true,
    this.width = 1,
    this.height = 0.28,
    required this.onPressed,
  });
  final String? backdropPath;
  final String? movieName;
  final String? movieReleaseDate;
  final bool showMovieInfoText;
  final double width;
  final double height;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.sw,
      height: context.isPortrait ? height.sh : (height * 2).sh,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AppCachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: AppConstants.showMoviesImage(
              backdropPath!,
            ),
            width: width.sw,
            height: context.isPortrait ? height.sh : (height * 2).sh,
          ),
          Container(color: Colors.black54),
          PlayTrailerButton(
            onPlayPressed: onPressed,
          ),
          if (showMovieInfoText)
            Positioned(
              bottom: 16.0,
              left: 16.0,
              right: 16.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Play trailer',
                    style: AppTextStyle.title18White,
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    '$movieName ($movieReleaseDate)',
                    style: AppTextStyle.label14Grey,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}

class PlayTrailerButton extends StatelessWidget {
  const PlayTrailerButton({
    Key? key,
    required this.onPlayPressed,
    this.size = 56.0,
  }) : super(key: key);

  final VoidCallback onPlayPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPlayPressed,
      child: Container(
        width: context.isPortrait ? size.w : size.h,
        height: context.isPortrait ? size.w : size.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white.withOpacity(0.8),
            width: 2.0,
          ),
        ),
        child: Icon(
          Icons.play_arrow_rounded,
          size: 36.r,
          color: Colors.white.withOpacity(0.8),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:movies_app/core/utils/app_text_style.dart';

// import '../../../../core/utils/app_constants.dart';
// import '../../../../core/widgets/app_cached_network_image_widget.dart';

// class MovieTrailerWidget extends StatelessWidget {
//   const MovieTrailerWidget({
//     super.key,
//     required this.backdropPath,
//     required this.movieName,
//     required this.movieReleaseDate,
//     this.showMovieInfoText = true,
//   });
//   final String? backdropPath;
//   final String movieName;
//   final String movieReleaseDate;
//   final bool showMovieInfoText;

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 16 / 9,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           AppCachedNetworkImage(
//             fit: BoxFit.cover,
//             imageUrl: AppConstants.showMoviesImage(
//               backdropPath!,
//             ),
//           ),
//           Container(
//             color: Colors.black54,
//           ),
//           const PlayTrailerButton(),
//           if (showMovieInfoText)
//             Positioned(
//               bottom: 16.0,
//               left: 16.0,
//               right: 16.0,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Play trailer',
//                     style: AppTextStyle.title18White,
//                   ),
//                   const SizedBox(
//                     height: 6.0,
//                   ),
//                   Text(
//                     '$movieName ($movieReleaseDate)',
//                     style: AppTextStyle.label14Grey,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ],
//               ),
//             )
//         ],
//       ),
//     );
//   }
// }

// class PlayTrailerButton extends StatelessWidget {
//   const PlayTrailerButton({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {},
//       child: Container(
//         width: 56.w,
//         height: 56.w,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           border: Border.all(
//             color: Colors.white.withOpacity(0.8),
//             width: 2.0,
//           ),
//         ),
//         child: Icon(
//           Icons.play_arrow_rounded,
//           size: 36.r,
//           color: Colors.white.withOpacity(0.8),
//         ),
//       ),
//     );
//   }
// }
