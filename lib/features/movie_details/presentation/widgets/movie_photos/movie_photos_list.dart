import 'package:flutter/material.dart';
import 'package:movies_app/config/routes/routes.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_images_entity/backdrop_entity.dart';

import '../../../../../core/widgets/container_with_label/container_with_label.dart';
import '../../screens/movie_gallery_screen.dart';
import 'movie_photo_item.dart';

class MoviePhotosList extends StatelessWidget {
  const MoviePhotosList({
    super.key,
    required this.moviePhotos,
    required this.movieEntity,
  });
  final List<BackdropEntity> moviePhotos;
  final MovieEntity movieEntity;
  @override
  Widget build(BuildContext context) {
    return ContainerWithLabel<BackdropEntity>(
      labelText: 'Photos',
      labelSubtext: moviePhotos.length.toString(),
      seeAllOnPressed: () {},
      generatedList: moviePhotos,
      generatedListHeight: 0.2,
      itemBuilder: (context, index) => MoviePhotoItem(
        imageUrl: moviePhotos[index].filePath,
        onPressed: () {
          AppNavigator.navigateNamedTo(
            context,
            AppRoutes.movieGalleryScreen,
            arguments: MovieGalleryScreenParams(
              initialIndex: index,
              photosList: moviePhotos,
              movieEntity: movieEntity,
            ),
          );
        },
      ),
    );
  }
}
