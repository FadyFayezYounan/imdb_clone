import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text_style.dart';

class SeeMoreTextWidget extends StatelessWidget {
  const SeeMoreTextWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return ExpandableText(
      text,
      expandText: 'show more',
      collapseText: 'show less',
      linkColor: AppColors.primaryColor,
      maxLines: 6,
      collapseOnTextTap: true,
      expandOnTextTap: true,
      textAlign: TextAlign.start,
      style: AppTextStyle.title14White,
      animation: true,
      animationDuration: const Duration(seconds: 1),
    );
  }
}
