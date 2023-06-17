import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/home/presentation/widgets/see_all/movie_score_widget.dart';
import '../../../../../config/routes/app_navigator.dart';
import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/add_to_watch_list_clipped_button.dart';
import '../../../../../core/widgets/app_cached_network_image_widget.dart';
import '../../../domain/entities/movie_entity.dart';

class SeeAllMovieWidget extends StatelessWidget {
  const SeeAllMovieWidget({super.key, required this.movieEntity});
  final MovieEntity movieEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNavigator.navigateNamedTo(
          context,
          AppRoutes.movieDetailsScreen,
          arguments: movieEntity,
        );
      },
      child: Row(
        children: [
          Stack(
            children: [
              if (movieEntity.posterPath != null)
                AppCachedNetworkImage(
                  width: context.isPortrait ? 0.24.sw : 0.12.sw,
                  imageUrl:
                      AppConstants.showMoviesImage(movieEntity.posterPath!),
                  fit: BoxFit.cover,
                ),
              AddToWatchListClippedButton(
                width: 0.08.sw,
                height: 32.0,
                hideBorderRadius: true,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMovieTitle(),
                const SizedBox(
                  height: 8.0,
                ),
                if (movieEntity.releaseDate != null) _buildMovieReleaseData(),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: AppColors.primaryColor,
                      size: 18.0,
                    ),
                    Text(' ${movieEntity.voteAverage.toStringAsPrecision(2)}'),
                    const SizedBox(
                      width: 8.0,
                    ),
                    MovieScoreWidget(voteCount: movieEntity.voteCount),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text _buildMovieReleaseData() {
    return Text(
      movieEntity.releaseDate!,
      style: AppTextStyle.label10Grey,
    );
  }

  Text _buildMovieTitle() {
    return Text(
      movieEntity.title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyle.title14White,
    );
  }
}
