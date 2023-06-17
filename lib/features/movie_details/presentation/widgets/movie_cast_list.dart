import 'package:flutter/material.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/cast_widget/cast_widget.dart';
import '../../../../core/widgets/labeled_horizontal_list/labeled_horizontal_list.dart';
import '../../domain/entities/movie_cast_and_crew_entity/cast_entity.dart';

class MovieCastList extends StatelessWidget {
  const MovieCastList({
    super.key,
    required this.castList,
  });
  final List<CastEntity> castList;
  @override
  Widget build(BuildContext context) {
    return LabeledHorizontalList<CastEntity>(
      labelText: AppStrings.cast,
      seeAllOnPressed: () {},
      generatedList: castList,
      itemBuilder: (context, index) => CastWidget(
        castEntity: castList[index],
      ),
    );
  }
}
