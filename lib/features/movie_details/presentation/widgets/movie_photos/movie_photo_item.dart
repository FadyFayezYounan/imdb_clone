import 'package:flutter/material.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/app_cached_network_image_widget.dart';

class MoviePhotoItem extends StatelessWidget {
  const MoviePhotoItem({
    super.key,
    required this.imageUrl,
    required this.onPressed,
  });
  final String imageUrl;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: AppCachedNetworkImage(
          loadingIcon: Icons.theaters_rounded,
          borderRadius: BorderRadius.circular(12.0),
          imageUrl: AppConstants.showMoviesImage(
            imageUrl,
          ),
          //width: context.isPortrait ? 0.64.sw : 0.33.sw,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}














// import 'package:flutter/widgets.dart';
// class GalleryExampleItem {
//   GalleryExampleItem({
//     required this.id,
//     required this.resource,
//     this.isSvg = false,
//   });

//   final String id;
//   final String resource;
//   final bool isSvg;
// }

// class GalleryExampleItemThumbnail extends StatelessWidget {
//   const GalleryExampleItemThumbnail({
//     Key? key,
//     required this.galleryExampleItem,
//     required this.onTap,
//   }) : super(key: key);

//   final GalleryExampleItem galleryExampleItem;

//   final GestureTapCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 5.0),
//       child: GestureDetector(
//         onTap: onTap,
//         child: Hero(
//           tag: galleryExampleItem.id,
//           child: Image.network(galleryExampleItem.resource, height: 80.0),
//         ),
//       ),
//     );
//   }
// }

// List<GalleryExampleItem> galleryItems = <GalleryExampleItem>[
//   GalleryExampleItem(
//     id: "tag1",
//     resource:
//         "https://www.themoviedb.org/t/p/w220_and_h330_face/7bEYwjUvlJW7GerM8GYmqwl4oS3.jpg",
//   ),
//   GalleryExampleItem(
//       id: "tag2",
//       resource:
//           "https://www.themoviedb.org/t/p/w220_and_h330_face/jQ0gylJMxWSL490sy0RrPj1Lj7e.jpg",
//       isSvg: false),
//   GalleryExampleItem(
//     id: "tag3",
//     resource:
//         "https://www.themoviedb.org/t/p/w220_and_h330_face/vDGr1YdrlfbU9wxTOdpf3zChmv9.jpg",
//   ),
//   GalleryExampleItem(
//     id: "tag4",
//     resource:
//         "https://www.themoviedb.org/t/p/w220_and_h330_face/hYqOjJ7Gh1fbqXrxlIao1g8ZehF.jpg",
//   ),
// ];
