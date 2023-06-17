import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/utils.dart';

class FirstPageErrorWidget extends StatelessWidget {
  const FirstPageErrorWidget({super.key, required this.error});
  final dynamic error;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error_rounded,
          color: AppColors.errorColor,
          size: 108.r,
        ),
        const SizedBox(
          height: 32.0,
        ),
        if (error == null)
          Text(
            AppStrings.unExpectedError,
            style:
                AppTextStyle.title18White.copyWith(color: AppColors.errorColor),
          ),
        if (error != null)
          Text(error.toString(),
              style: AppTextStyle.title18White
                  .copyWith(color: AppColors.errorColor)),
      ],
    );
  }
}
