import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/utils.dart';

class NoItemsFoundedWidget extends StatelessWidget {
  const NoItemsFoundedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.emptyBox,
          width: 116.w,
          height: 116.w,
        ),
        const SizedBox(
          height: 32.0,
        ),
        Text(
          'No Item Founded.',
          style: AppTextStyle.title18White.copyWith(
            color: AppColors.lightGreyColor,
          ),
        )
      ],
    );
  }
}
