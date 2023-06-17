// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:movies_app/core/utils/app_constants.dart';
// import 'package:movies_app/core/widgets/app_cached_network_image_widget.dart';
// import 'package:movies_app/core/widgets/container_with_label/container_with_label.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:photo_view/photo_view_gallery.dart';

// import '../../../domain/entities/movie_images_entity/backdrop_entity.dart';
// import 'movie_photo_item.dart';

// class HorizontalMoviePhotosList extends StatefulWidget {
//   const HorizontalMoviePhotosList({
//     super.key,
//     required this.seeAllOnPressed,
//     required this.moviePhotosList,
//   });
//   final VoidCallback seeAllOnPressed;
//   final List<BackdropEntity> moviePhotosList;
//   @override
//   State<HorizontalMoviePhotosList> createState() =>
//       _HorizontalMoviePhotosListState();
// }

// class _HorizontalMoviePhotosListState extends State<HorizontalMoviePhotosList> {
//   late ScrollController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = PageController();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final appOrientation = MediaQuery.of(context).orientation;
//     return ContainerWithLabel(
//       labelText: 'Photos',
//       seeAllOnPressed: () {},
//       child: SizedBox(
//         height: appOrientation == Orientation.portrait ? 0.2.sh : 0.4.sh,
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           controller: _controller,
//           itemCount: widget.moviePhotosList.length,
//           itemBuilder: (BuildContext context, int index) {
//             return MoviePhotoItem(
//               imageUrl: widget.moviePhotosList[index].filePath,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// //   void open(BuildContext context, final int index) {
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(
// //         builder: (context) => GalleryPhotoViewWrapper(
// //           galleryItems: galleryItems,
// //           backgroundDecoration: const BoxDecoration(
// //             color: Colors.black,
// //           ),
// //           initialIndex: index,
// //           scrollDirection: Axis.horizontal,
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class GalleryPhotoViewWrapper extends StatefulWidget {
// //   GalleryPhotoViewWrapper({
// //     super.key,
// //     this.loadingBuilder,
// //     this.backgroundDecoration,
// //     this.minScale,
// //     this.maxScale,
// //     this.initialIndex = 0,
// //     required this.galleryItems,
// //     this.scrollDirection = Axis.horizontal,
// //   }) : pageController = PageController(initialPage: initialIndex);

// //   final LoadingBuilder? loadingBuilder;
// //   final BoxDecoration? backgroundDecoration;
// //   final dynamic minScale;
// //   final dynamic maxScale;
// //   final int initialIndex;
// //   final PageController pageController;
// //   final List<GalleryExampleItem> galleryItems;
// //   final Axis scrollDirection;

// //   @override
// //   State<StatefulWidget> createState() {
// //     return _GalleryPhotoViewWrapperState();
// //   }
// // }

// // class _GalleryPhotoViewWrapperState extends State<GalleryPhotoViewWrapper> {
// //   late int currentIndex = widget.initialIndex;

// //   void onPageChanged(int index) {
// //     setState(() {
// //       currentIndex = index;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Container(
// //         decoration: widget.backgroundDecoration,
// //         constraints: BoxConstraints.expand(
// //           height: MediaQuery.of(context).size.height,
// //         ),
// //         child: Stack(
// //           alignment: Alignment.bottomRight,
// //           children: <Widget>[
// //             PhotoViewGallery.builder(
// //               scrollPhysics: const BouncingScrollPhysics(),
// //               builder: _buildItem,
// //               itemCount: widget.galleryItems.length,
// //               loadingBuilder: widget.loadingBuilder,
// //               backgroundDecoration: widget.backgroundDecoration,
// //               pageController: widget.pageController,
// //               onPageChanged: onPageChanged,
// //               scrollDirection: widget.scrollDirection,
// //             ),
// //             Container(
// //               padding: const EdgeInsets.all(20.0),
// //               child: Text(
// //                 "Image ${currentIndex + 1}",
// //                 style: const TextStyle(
// //                   color: Colors.white,
// //                   fontSize: 17.0,
// //                   decoration: null,
// //                 ),
// //               ),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
// //     final GalleryExampleItem item = widget.galleryItems[index];
// //     return PhotoViewGalleryPageOptions(
// //       imageProvider: NetworkImage(item.resource),
// //       initialScale: PhotoViewComputedScale.contained,
// //       minScale: PhotoViewComputedScale.contained,
// //       // minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
// //       maxScale: PhotoViewComputedScale.covered * 4.1,
// //       heroAttributes: PhotoViewHeroAttributes(tag: item.id),
// //     );
// //   }
// // }


