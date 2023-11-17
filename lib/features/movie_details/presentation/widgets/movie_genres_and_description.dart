import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/utils.dart';
import 'package:movies_app/core/widgets/app_cached_network_image_widget.dart';
import 'package:movies_app/core/widgets/see_more_text_widget.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity/genre_entity.dart';

class MovieImageGenresAndDescriptionText extends StatelessWidget {
  const MovieImageGenresAndDescriptionText({
    super.key,
    required this.imagePath,
    required this.descriptionText,
    required this.genresList,
    required this.onGenresButtonPressed,
  });
  final String? imagePath;
  final String? descriptionText;
  final List<GenreEntity> genresList;
  final Function(int index) onGenresButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (imagePath != null)
            Expanded(
              flex: 1,
              child: AppCachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: AppConstants.showMoviesImage(imagePath!),
              ),
            ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MovieGenresList(
                  genresList: genresList,
                  onGenresButtonPressed: onGenresButtonPressed,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                if (descriptionText != null)
                  SeeMoreTextWidget(text: descriptionText!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MovieGenresList extends StatelessWidget {
  const MovieGenresList({
    super.key,
    required this.genresList,
    required this.onGenresButtonPressed,
  });
  final List<GenreEntity> genresList;
  final Function(int index) onGenresButtonPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.0,
      child: ListView.builder(
        itemCount: genresList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(
            right: 8.0,
          ),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
            ),
            onPressed: () => onGenresButtonPressed(index),
            child: Text(
              genresList[index].name,
              style: AppTextStyle.title14White,
            ),
          ),
        ),
      ),
    );
  }
}
