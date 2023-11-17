import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity/genre_entity.dart';

import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/labeled_horizontal_list/labeled_horizontal_list.dart';

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
    return LabeledHorizontalList<GenreEntity>(
      labelText: listTitle,
      seeAllOnPressed: () {},
      generatedList: keywordsList,
      generatedListHeight: 0.06,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(right: 8.0),
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
            keywordsList[index].name,
            style: AppTextStyle.title14White,
          ),
        ),
      ),
    );
  }
}
