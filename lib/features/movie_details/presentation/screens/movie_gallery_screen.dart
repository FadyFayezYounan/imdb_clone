import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/movie_widget/movie_widget.dart';
import '../../domain/entities/movie_images_entity/backdrop_entity.dart';
import '../widgets/movie_gallery_screen/gallery_page_view.dart';

class MovieGalleryScreen extends StatefulWidget {
  const MovieGalleryScreen({
    super.key,
    required this.movieGalleryScreenParams,
  });
  final MovieGalleryScreenParams movieGalleryScreenParams;

  @override
  State<MovieGalleryScreen> createState() => _MovieGalleryScreenState();
}

class _MovieGalleryScreenState extends State<MovieGalleryScreen> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    _currentIndex.value = widget.movieGalleryScreenParams.initialIndex;
  }

  @override
  void dispose() {
    _currentIndex.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.containerColor,
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              color: AppColors.scaffoldBackgroundColor,
              child: GalleryPageView(
                initialIndex: widget.movieGalleryScreenParams.initialIndex,
                photosList: widget.movieGalleryScreenParams.photosList,
                onPageChanged: (index) {
                  _currentIndex.value = index;
                },
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                left: 16.0,
                right: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CurrentPhotoIndex(
                    currentIndex: _currentIndex,
                    movieAlbumScreenParams: widget.movieGalleryScreenParams,
                  ),
                  const Divider(),
                  CurrentMovieWidget(
                    movieEntity: widget.movieGalleryScreenParams.movieEntity,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CurrentPhotoIndex extends StatelessWidget {
  const CurrentPhotoIndex({
    super.key,
    required this.movieAlbumScreenParams,
    required this.currentIndex,
  });
  final MovieGalleryScreenParams movieAlbumScreenParams;
  final ValueNotifier<int> currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: currentIndex,
          builder: (context, index, child) => Text('${index + 1}'),
        ),
        Text(' of ${movieAlbumScreenParams.photosList.length}'),
        const SizedBox(
          width: 8.0,
        ),
        const Text(
          '|',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Text(
            movieAlbumScreenParams.movieEntity.title,
            style: AppTextStyle.body16White,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class CurrentMovieWidget extends StatelessWidget {
  const CurrentMovieWidget({
    super.key,
    required this.movieEntity,
  });

  final MovieEntity movieEntity;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: SizedBox(
          width: 1.sw,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: context.isPortrait ? 0.42.sh : 0.84.sh,
                child: MovieWidget(
                  movieEntity: movieEntity,
                  showMoreInfoButton: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MovieGalleryScreenParams {
  final List<BackdropEntity> photosList;
  final int initialIndex;
  final MovieEntity movieEntity;

  MovieGalleryScreenParams({
    required this.photosList,
    required this.initialIndex,
    required this.movieEntity,
  });
}
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:movies_app/config/routes/app_navigator.dart';
// import 'package:movies_app/core/widgets/app_cached_network_image_widget.dart';
// import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

// import '../../../../core/utils/utils.dart';
// import '../../../../core/widgets/movie_widget/movie_widget.dart';
// import '../../domain/entities/movie_images_entity/backdrop_entity.dart';

// class MovieAlbumScreen extends StatefulWidget {
//   const MovieAlbumScreen({
//     super.key,
//     required this.movieAlbumScreenParams,
//   });
//   final MovieAlbumScreenParams movieAlbumScreenParams;

//   @override
//   State<MovieAlbumScreen> createState() => _MovieAlbumScreenState();
// }

// class _MovieAlbumScreenState extends State<MovieAlbumScreen> {
//   late PageController _pageController;

//   final ValueNotifier<int> _currentIndex = ValueNotifier(0);

//   @override
//   void initState() {
//     super.initState();
//     _currentIndex.value = widget.movieAlbumScreenParams.initialIndex;
//     _pageController = PageController(initialPage: _currentIndex.value);
//   }

//   @override
//   void dispose() {
//     _currentIndex.dispose();
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           Expanded(
//             flex: 2,
//             child: PageView.builder(
//               controller: _pageController,
//               onPageChanged: (index) {
//                 _currentIndex.value = index;
//                 // setState(() {
//                 //   _initialIndex = index;
//                 // });
//               },
//               physics: const BouncingScrollPhysics(),
//               itemCount: widget.movieAlbumScreenParams.photosList.length,
//               itemBuilder: (context, index) {
//                 final image = widget.movieAlbumScreenParams.photosList[index];
//                 return MovieAlbumPhoto(image: image);
//               },
//             ),
//           ),
//           Flexible(
//             flex: 1,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CurrentPhotoIndex(
//                     currentIndex: _currentIndex,
//                     movieAlbumScreenParams: widget.movieAlbumScreenParams,
//                   ),
//                   MovieAlbumWidget(
//                     movieEntity: widget.movieAlbumScreenParams.movieEntity,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CurrentPhotoIndex extends StatelessWidget {
//   const CurrentPhotoIndex({
//     super.key,
//     required this.movieAlbumScreenParams,
//     required this.currentIndex,
//   });
//   final MovieAlbumScreenParams movieAlbumScreenParams;
//   final ValueNotifier<int> currentIndex;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         ValueListenableBuilder(
//           valueListenable: currentIndex,
//           builder: (context, index, child) => Text('${index + 1}'),
//         ),
//         Text(' of ${movieAlbumScreenParams.photosList.length}'),
//         const SizedBox(
//           width: 8.0,
//         ),
//         const Text(
//           '|',
//           style: TextStyle(color: Colors.grey),
//         ),
//         const SizedBox(
//           width: 8.0,
//         ),
//         Expanded(
//           child: Text(
//             movieAlbumScreenParams.movieEntity.title,
//             style: AppTextStyle.body16White,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class MovieAlbumWidget extends StatelessWidget {
//   const MovieAlbumWidget({
//     super.key,
//     required this.movieEntity,
//   });

//   final MovieEntity movieEntity;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: SingleChildScrollView(
//         child: SizedBox(
//           width: 1.sw,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 16.0,
//               ),
//               SizedBox(
//                 height: context.isPortrait ? 0.42.sh : 0.84.sh,
//                 child: MovieWidget(
//                   movieEntity: movieEntity,
//                   showMoreInfoButton: false,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MovieAlbumPhoto extends StatefulWidget {
//   const MovieAlbumPhoto({
//     super.key,
//     required this.image,
//   });

//   final BackdropEntity image;

//   @override
//   State<MovieAlbumPhoto> createState() => _MovieAlbumPhotoState();
// }

// class _MovieAlbumPhotoState extends State<MovieAlbumPhoto>
//     with TickerProviderStateMixin {
//   late TransformationController _transformationController;
//   TapDownDetails? _tapDownDetails;
//   late AnimationController _animationController;
//   Animation<Matrix4>? _animation;

//   ///
//   final double _minScale = 1.0;
//   final double _maxScale = 4.0;

//   @override
//   void initState() {
//     super.initState();
//     _transformationController = TransformationController();
//     _animationController = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 300))
//       ..addListener(() {
//         _transformationController.value = _animation!.value;
//       });
//   }

//   @override
//   void dispose() {
//     _transformationController.dispose();
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         AspectRatio(
//           aspectRatio: widget.image.aspectRatio,
//           child: GestureDetector(
//             onTap: () {},
//             onDoubleTap: () {
//               final position = _tapDownDetails!.localPosition;
//               const double scale = 3;
//               final x = -position.dx * (scale - 1);
//               final y = -position.dy * (scale - 1);
//               final zoomed = Matrix4.identity()
//                 ..translate(x, y)
//                 ..scale(scale);
//               final end = _transformationController.value.isIdentity()
//                   ? zoomed
//                   : Matrix4.identity();
//               _animation = Matrix4Tween(
//                 begin: _transformationController.value,
//                 end: end,
//               ).animate(CurveTween(curve: Curves.easeOut)
//                   .animate(_animationController));
//               _animationController.forward(from: 0.0);
//             },
//             onDoubleTapDown: (details) {
//               _tapDownDetails = details;
//             },
//             child: InteractiveViewer(
//               clipBehavior: Clip.none,
//               minScale: _minScale,
//               maxScale: _maxScale,

//               panEnabled: false,
//               // scaleEnabled: false,
//               transformationController: _transformationController,
//               onInteractionEnd: (details) {
//                 _resetAnimation();
//               },
//               child: AppCachedNetworkImage(
//                 imageUrl: AppConstants.showMoviesImage(
//                   widget.image.filePath,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   void _resetAnimation() {
//     _animation = Matrix4Tween(
//       begin: _transformationController.value,
//       end: Matrix4.identity(),
//     ).animate(
//         CurvedAnimation(parent: _animationController, curve: Curves.easeOut));
//     _animationController.forward(from: 0.0);
//   }
// }

// class MovieAlbumScreenParams {
//   final List<BackdropEntity> photosList;
//   final int initialIndex;
//   final MovieEntity movieEntity;

//   MovieAlbumScreenParams({
//     required this.photosList,
//     required this.initialIndex,
//     required this.movieEntity,
//   });
// }
