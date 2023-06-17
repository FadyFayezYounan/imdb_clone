import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/utils.dart';

class SeeAllBlueButton extends StatelessWidget {
  const SeeAllBlueButton({
    Key? key,
    required this.seeAllOnPressed,
  }) : super(key: key);

  final VoidCallback seeAllOnPressed;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: seeAllOnPressed,
          borderRadius: BorderRadius.circular(4.0),
          child: Padding(
            padding: EdgeInsets.all(4.sp),
            child: const Text(
              AppStrings.seeAll,
              style: TextStyle(color: AppColors.blueColor),
            ),
          ),
        ),
      ),
    );
  }
}
