import 'package:flutter/material.dart';

import '../../../../../core/utils/utils.dart';

class EmptySearchListWidget extends StatelessWidget {
  const EmptySearchListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: Icon(
            Icons.search_rounded,
            color: AppColors.lightGreyColor,
            size: 64.0,
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Center(
          child: Text(
            'Search for movies',
            style: AppTextStyle.label14Grey,
          ),
        ),
      ],
    );
  }
}
