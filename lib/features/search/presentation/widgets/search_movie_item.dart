import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/utils.dart';
import 'package:movies_app/features/search/presentation/cubit/search_cubit.dart';

import '../../../../config/routes/app_navigator.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/widgets/app_cached_network_image_widget.dart';
import '../../../home/domain/entities/movie_entity.dart';

class SearchMovieItem extends StatelessWidget {
  const SearchMovieItem({
    super.key,
    required this.movieEntity,
    this.onDeleteButtonPressed,
  });
  final MovieEntity movieEntity;
  final VoidCallback? onDeleteButtonPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        AppNavigator.navigateNamedTo(
          context,
          AppRoutes.movieDetailsScreen,
          arguments: movieEntity,
        );
        await BlocProvider.of<SearchCubit>(context)
            .cacheSearchedMovieFunc(movieEntity);
      },
      child: SizedBox(
        //width: context.isPortrait ? 0.2.sw : 0.1.sw,
        height: context.isPortrait ? 0.14.sh : 0.28.sh,
        child: Row(
          children: [
            if (movieEntity.posterPath != null)
              AppCachedNetworkImage(
                width: context.isPortrait ? 0.2.sw : 0.1.sw,
                imageUrl: AppConstants.showMoviesImage(movieEntity.posterPath!),
                fit: BoxFit.cover,
              ),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
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
                      Text(
                          ' ${movieEntity.voteAverage.toStringAsPrecision(2)}'),
                      const SizedBox(
                        width: 8.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (onDeleteButtonPressed != null)
              IconButton(
                onPressed: onDeleteButtonPressed,
                icon: const Icon(
                  Icons.close_rounded,
                  color: Colors.grey,
                ),
              ),
          ],
        ),
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
