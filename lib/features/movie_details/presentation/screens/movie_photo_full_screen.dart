import 'package:flutter/material.dart';
import 'package:movies_app/config/routes/app_navigator.dart';
import 'package:movies_app/config/routes/app_routes.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/core/widgets/app_cached_network_image_widget.dart';

import '../../domain/entities/movie_images_entity/backdrop_entity.dart';
import '../widgets/movie_gallery_screen/gallery_page_view.dart';

class MoviePhotoFullScreen extends StatefulWidget {
  const MoviePhotoFullScreen({
    super.key,
    required this.moviePhotoFullScreenParams,
  });
  final MoviePhotoFullScreenParams moviePhotoFullScreenParams;

  @override
  State<MoviePhotoFullScreen> createState() => _MoviePhotoFullScreenState();
}

class _MoviePhotoFullScreenState extends State<MoviePhotoFullScreen> {
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.moviePhotoFullScreenParams.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GalleryPageView(
        initialIndex: _currentIndex,
        photosList: widget.moviePhotoFullScreenParams.photosList,
      ),
    );
  }
}

class MoviePhotoFullScreenParams {
  final List<BackdropEntity> photosList;
  final int initialIndex;

  MoviePhotoFullScreenParams({
    required this.photosList,
    required this.initialIndex,
  });
}
// import 'package:flutter/material.dart';
// import 'package:movies_app/core/utils/app_constants.dart';
// import 'package:movies_app/core/widgets/app_cached_network_image_widget.dart';

// import '../../domain/entities/movie_images_entity/backdrop_entity.dart';
// import 'movie_gallery_screen.dart';

// class MoviePhotoFullScreen extends StatelessWidget {
//   const MoviePhotoFullScreen({
//     super.key,
//     required this.moviePhotoFullScreenParams,
//   });
//   final MoviePhotoFullScreenParams moviePhotoFullScreenParams;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView.builder(
//         itemCount:  moviePhotoFullScreenParams.photosList.length,
//         itemBuilder: (context, index) {
//           final photo = moviePhotoFullScreenParams.photosList[index];
//           return AppCachedNetworkImage(
//             imageUrl: AppConstants.showMoviesImage(
//               photo.filePath,
//             ),
//             loadingIcon: Icons.theaters_rounded,
//           );
//         },
//       ),
//     );
//   }
// }

// class MoviePhotoFullScreenParams {
//   final List<BackdropEntity> photosList;
//   final int initialIndex;

//   MoviePhotoFullScreenParams({
//     required this.photosList,
//     required this.initialIndex,
//   });
// }
