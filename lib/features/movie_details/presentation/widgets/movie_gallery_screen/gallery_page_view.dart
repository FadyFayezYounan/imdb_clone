import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/routes/app_navigator.dart';
import 'package:movies_app/config/routes/app_routes.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../../../../core/utils/app_constants.dart';
import '../../../domain/entities/movie_images_entity/backdrop_entity.dart';
import '../../screens/movie_gallery_screen.dart';
import '../../screens/movie_photo_full_screen.dart';

typedef OnPageChangeCallBack = void Function(int index)?;

class GalleryPageView extends StatefulWidget {
  const GalleryPageView({
    super.key,
    required this.initialIndex,
    required this.photosList,
    this.onPageChanged,
  });
  final int initialIndex;
  final List<BackdropEntity> photosList;
  final OnPageChangeCallBack onPageChanged;

  @override
  State<GalleryPageView> createState() => _GalleryPageViewState();
}

class _GalleryPageViewState extends State<GalleryPageView> {
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return PhotoViewGallery.builder(
      pageController: _pageController,
      onPageChanged: widget.onPageChanged,
      itemCount: widget.photosList.length,
      scrollPhysics: const BouncingScrollPhysics(),
      builder: _buildMoviePhoto,
      loadingBuilder: _buildLoadingWidget,
      backgroundDecoration: const BoxDecoration(
        color: AppColors.scaffoldBackgroundColor,
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildMoviePhoto(
      BuildContext context, int index) {
    final BackdropEntity photo = widget.photosList[index];
    return PhotoViewGalleryPageOptions(
      imageProvider: NetworkImage(
        AppConstants.showMoviesImage(
          photo.filePath,
        ),
      ),
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained,
      maxScale: PhotoViewComputedScale.covered * 2.4,
      heroAttributes: PhotoViewHeroAttributes(tag: photo),
      onTapDown: (_, __, ___) {
        AppNavigator.navigateNamedTo(
          context,
          AppRoutes.moviePhotoFullScreen,
          arguments: MoviePhotoFullScreenParams(
            initialIndex: index,
            photosList: widget.photosList,
          ),
        );
      },
    );
  }

  Widget _buildLoadingWidget(BuildContext context, ImageChunkEvent? event) {
    return Center(
      child: Icon(
        Icons.theaters_rounded,
        size: 64.sp,
      ),
    );
  }
}
