import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/utils.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import '../app_cached_network_image_widget.dart';

Future<dynamic> showMovieMoreInfoInModelSheet(
    BuildContext context, MovieEntity movieEntity) {
  return showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    builder: (context) {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(AppPadding.padding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                AppCachedNetworkImage(
                  width: 0.2.sw,
                  imageUrl:
                      AppConstants.showMoviesImage(movieEntity.posterPath!),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movieEntity.title),
                    if (movieEntity.releaseDate != null)
                      Text(movieEntity.releaseDate!),
                  ],
                ),
              ],
            ),
            const Divider(),
            Text(
              movieEntity.overview,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              leading: const Icon(Icons.add_rounded),
              title: const Text(AppStrings.addToWatchlist),
            ),
            ListTile(
              onTap: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              leading: const Icon(Icons.star_outline_rounded),
              title: const Text(AppStrings.rateThis),
            ),
          ],
        ),
      );
    },
  );
}
