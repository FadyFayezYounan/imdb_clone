import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/utils.dart';

class MovieNumberOfStarsRateMovieAndLanguage extends StatelessWidget {
  const MovieNumberOfStarsRateMovieAndLanguage(
      {super.key, required this.starsNumber, required this.voteCount});
  final double starsNumber;
  final int voteCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: MovieSmallInfoWidget(
                icon: Icons.star_rounded,
                title: '${starsNumber.toStringAsPrecision(2)}/10',
                subtitle: formatNumber(voteCount),
                onPressed: () {},
              ),
            ),
            Expanded(
              child: MovieSmallInfoWidget(
                icon: Icons.star_outline_rounded,
                iconColor: AppColors.blueColor,
                titleColor: AppColors.blueColor,
                title: 'Rate this',
                onPressed: () {},
              ),
            ),
            Expanded(
              child: MovieSmallInfoWidget(
                title: 'CRITIC\nREVIEWS',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatNumber(int number) {
    if (number >= 1000000) {
      return "${(number / 1000000).toStringAsFixed(1)}M";
    } else if (number >= 1000) {
      return "${(number / 1000).toStringAsFixed(1)}K";
    } else {
      return number.toString();
    }
  }
}

class MovieSmallInfoWidget extends StatelessWidget {
  const MovieSmallInfoWidget({
    super.key,
    this.icon,
    this.iconColor = AppColors.primaryColor,
    required this.title,
    this.titleColor = Colors.white,
    this.subtitle,
    required this.onPressed,
  });
  final IconData? icon;
  final Color iconColor;
  final String title;
  final Color titleColor;
  final String? subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(
              icon,
              color: iconColor,
              size: 30.0,
            ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            title,
            style: AppTextStyle.body16White.copyWith(
              color: titleColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 4.0,
          ),
          if (subtitle != null)
            Text(subtitle!, style: AppTextStyle.label10Grey),
        ],
      ),
    );
  }
}
