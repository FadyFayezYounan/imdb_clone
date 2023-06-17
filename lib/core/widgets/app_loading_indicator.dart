import 'package:flutter/material.dart';

import '../utils/utils.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({
    super.key,
    this.showLoadingText = true,
  });
  final bool showLoadingText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircularProgressIndicator.adaptive(),
          if (showLoadingText)
            const SizedBox(
              height: 16.0,
            ),
          if (showLoadingText)
            const Text(
              AppStrings.loading,
            ),
        ],
      ),
    );
  }
}
