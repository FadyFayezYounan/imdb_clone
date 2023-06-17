import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/utils.dart';

class MovieTitleWidget extends StatelessWidget {
  const MovieTitleWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyle.title14White,
      ),
    );
  }
}
