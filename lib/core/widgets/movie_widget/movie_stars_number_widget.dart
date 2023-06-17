import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/utils.dart';

class MovieStarsNumberWidget extends StatelessWidget {
  const MovieStarsNumberWidget({
    super.key,
    required this.starsNumber,
  });
  final double starsNumber;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 6.0,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.star_rounded,
            color: AppColors.primaryColor,
            size: 18.0,
          ),
          Text(' ${starsNumber.toStringAsPrecision(2)}'),
        ],
      ),
    );
  }
}
