import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text_style.dart';

class AppTheme {
  static TextTheme darkTextTheme = TextTheme(
    bodyLarge: AppTextStyle.body16White,
    titleMedium: AppTextStyle.title18White,
    bodySmall: AppTextStyle.body12WhiteBold,
    labelSmall: AppTextStyle.label10Grey,
    labelMedium: AppTextStyle.label14Grey,
    titleSmall: AppTextStyle.title14White,
    headlineSmall: AppTextStyle.headline24White,
    headlineMedium: AppTextStyle.headline28White,
  );

  static ThemeData dark() {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(
          color: AppColors.secondaryColor,
        ),
        elevation: 0.0, // 0.4
        //shadowColor: AppColors.secondaryColor.withOpacity(0.5),
        backgroundColor: AppColors.appBarColor,
        titleTextStyle: darkTextTheme.titleMedium,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.appBarColor,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      cardColor: AppColors.containerColor,
      textTheme: darkTextTheme,
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.navBarColor,
        // constraints: BoxConstraints.tightFor(
        //   height: 0.5.sh,
        // ),
      ),
      colorScheme: const ColorScheme.dark(
          primary: AppColors.primaryColor,
          secondary: AppColors.secondaryColor,
          brightness: Brightness.dark,
          error: AppColors.errorColor),
    );
  }
}
