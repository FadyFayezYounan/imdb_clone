import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/app_injector.dart';
import 'package:movies_app/core/bloc_observer/app_bloc_observer.dart';
import 'app.dart';
import 'core/utils/app_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await AppInjector.init();
  Bloc.observer = AppBlocObserver();
  runApp(
    EasyLocalization(
      path: AppConstants.translationsPath,
      supportedLocales: const [
        Locale(AppConstants.enCode),
        Locale(AppConstants.arCode),
      ],
      fallbackLocale: const Locale(AppConstants.enCode),
      startLocale: const Locale(AppConstants.enCode),
      child: const ImdbApp(),
    ),
  );
}
