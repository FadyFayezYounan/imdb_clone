import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_text_style.dart';

// typedef RefreshCallback = Future<void> Function();

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    super.key,
    this.onRefresh,
  });

  final RefreshCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return onRefresh != null
        ? RefreshIndicator(
            onRefresh: onRefresh!,
            child: _buildErrorScreenBody(),
          )
        : _buildErrorScreenBody();
  }

  Widget _buildErrorScreenBody() {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            width: 0.8.sw,
            height: 0.44.sh,
            child: Image.asset(
              AppImages.noInternet,
            ),
          ),
          Text(
            '"Inconceivable!"',
            style: AppTextStyle.headline32White,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 48.0,
              vertical: 16.0,
            ),
            child: Text(
              'Unfortunately, something went wrong. Our engineers are working hard to get everything back in shape.',
              style: AppTextStyle.body16White,
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            'Please verify your network and try again later',
            style: AppTextStyle.body16White,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
