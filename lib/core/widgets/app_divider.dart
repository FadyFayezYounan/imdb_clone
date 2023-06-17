import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1.2,
      color: AppColors.lightGreyColor,
    );
  }
}
