import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/widgets/labeled_horizontal_list/yellow_divider.dart';

import '../../utils/utils.dart';
import 'see_all_blue_button.dart';

typedef LabeledContainerItemBuilderCallBack = Widget Function(
  BuildContext context,
  int index,
);

class LabeledHorizontalList<T> extends StatelessWidget {
  /// this widget is used to generated a horizontal list of type [T].
  const LabeledHorizontalList({
    super.key,
    required this.labelText,
    this.labelSubtext,
    required this.seeAllOnPressed,
    required this.generatedList,
    required this.itemBuilder,
    this.generatedListHeight = 0.45, // from screen height.
  });
  final String labelText;
  final String? labelSubtext;
  final VoidCallback seeAllOnPressed;

  final List<T> generatedList;
  final LabeledContainerItemBuilderCallBack itemBuilder;
  final double generatedListHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.padding),
      decoration: const BoxDecoration(
        color: AppColors.containerColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            spreadRadius: 8.0,
            blurRadius: 16.0,
          ),
        ],
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const YellowDivider(),
                Text(
                  labelText,
                  style: AppTextStyle.headline20White,
                ),
                if (labelSubtext != null)
                  const SizedBox(
                    width: 8.0,
                  ),
                if (labelSubtext != null)
                  Text(
                    labelSubtext!,
                    style: AppTextStyle.label14Grey,
                  ),
                const Spacer(),
                SeeAllBlueButton(seeAllOnPressed: seeAllOnPressed),
              ],
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          SizedBox(
            height: context.isPortrait
                ? generatedListHeight.sh
                : (generatedListHeight * 2).sh,
            //height: generatedListHeight.h,
            child: ListView.builder(
              itemCount: generatedList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: itemBuilder,
            ),
          ),
        ],
      ),
    );
  }
}
