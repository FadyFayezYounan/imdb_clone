import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity/genre_entity.dart';

import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/container_with_label/container_with_label.dart';

class MovieKeywordsList extends StatelessWidget {
  const MovieKeywordsList({
    super.key,
    required this.listTitle,
    required this.currentMovieId,
    required this.keywordsList,
    required this.onGenresButtonPressed,

    //required this.seeAllOnPressedFunction,
  });
  final String listTitle;
  final int currentMovieId;
  final List<GenreEntity> keywordsList;
  final Function(int index) onGenresButtonPressed;

  @override
  Widget build(BuildContext context) {
    return ContainerWithLabel<GenreEntity>(
      labelText: listTitle,
      seeAllOnPressed: () {},
      generatedList: keywordsList,
      generatedListHeight: 0.06,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: OutlinedButton(
          onPressed: () => onGenresButtonPressed(index),
          child: Text(
            keywordsList[index].name,
            style: AppTextStyle.title14White,
          ),
        ),
      ),
    );
  }
}
