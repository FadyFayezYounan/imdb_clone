import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/routes/route_generator.dart';
import 'package:movies_app/features/movie_details/presentation/cubit/movie_videos_cubit/movie_videos_cubit.dart';
import 'core/utils/utils.dart';
import 'features/search/presentation/cubit/search_cubit.dart';
import 'config/themes/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:movies_app/app_injector.dart' as di;

class ImdbApp extends StatelessWidget {
  const ImdbApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                di.sl<SearchCubit>()..getCachedMoviesListFunc(),
          ),
          // BlocProvider(
          //   create: (context) => di.sl<MovieVideosCubit>(),
          // ),
        ],
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: AppConstants.appName,
          theme: AppTheme.dark(),
          onGenerateRoute: RouteGenerator.getRoute,
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:movies_app/config/routes/route_generator.dart';
// import 'features/search/presentation/cubit/search_cubit.dart';
// import 'config/themes/app_theme.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:movies_app/app_injector.dart' as di;

// class ImdbApp extends StatelessWidget {
//   const ImdbApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context, child) => BlocProvider(
//         create: (context) => di.sl<SearchCubit>()..getCachedMoviesListFunc(),
//         child: MaterialApp(
//           localizationsDelegates: context.localizationDelegates,
//           supportedLocales: context.supportedLocales,
//           locale: context.locale,
//           debugShowCheckedModeBanner: false,
//           title: 'IMDb',
//           theme: AppTheme.dark(),
//           onGenerateRoute: RouteGenerator.getRoute,
//         ),
//       ),
//     );
//   }
// }
