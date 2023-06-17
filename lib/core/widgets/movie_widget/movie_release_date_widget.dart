import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/utils.dart';

class MovieReleaseDateWidget extends StatelessWidget {
  const MovieReleaseDateWidget({
    super.key,
    required this.releaseDate,
  });
  final String releaseDate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Text(
            releaseDate,
            style: AppTextStyle.label10Grey,
          ),
        ],
      ),
    );
  }
}
