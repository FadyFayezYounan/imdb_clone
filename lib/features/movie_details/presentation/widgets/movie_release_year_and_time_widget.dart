import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_values.dart';

import '../../../../core/utils/app_text_style.dart';

class MovieReleaseYearAndTimeWidget extends StatelessWidget {
  final String? movieReleaseYear;
  final int? movieTime;
  const MovieReleaseYearAndTimeWidget({
    Key? key,
    required this.movieReleaseYear,
    required this.movieTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.padding,
        vertical: 4.0,
      ),
      child: Row(
        children: [
          if (movieReleaseYear != null)
            Text(
              movieReleaseYear!,
              style: AppTextStyle.label14Grey,
            ),
          const SizedBox(
            width: 8.0,
          ),
          if (movieTime != null)
            Text(
              convertMinutesToHoursAndMinutes(movieTime!),
              style: AppTextStyle.label14Grey,
            ),
        ],
      ),
    );
  }

  String convertMinutesToHoursAndMinutes(int minutes) {
    int hours = (minutes / 60).floor();
    int remainingMinutes = minutes - (hours * 60);
    return "${hours}h ${remainingMinutes}m";
  }
}
