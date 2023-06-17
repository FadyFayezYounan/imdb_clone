import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/config/routes/app_routes.dart';
import 'package:movies_app/core/screens/paginated_screen/paginated_screen.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/home/domain/entities/see_all_screen_params.dart';
import 'package:movies_app/features/home/presentation/screens/bottom_nav_bar_screen.dart';
import 'package:movies_app/app_injector.dart' as di;
import 'package:movies_app/features/home/presentation/screens/see_all_screen.dart';
import 'package:movies_app/features/movie_details/presentation/screens/movie_gallery_screen.dart';
import 'package:movies_app/features/movie_details/presentation/screens/movie_details_screen.dart';

import '../../features/home/domain/entities/paginated_screen_params.dart';
import '../../features/movie_details/presentation/cubit/movie_details_cubit.dart';
import '../../features/movie_details/presentation/cubit/movie_videos_cubit/movie_videos_cubit.dart';
import '../../features/movie_details/presentation/screens/movie_photo_full_screen.dart';

class RouteGenerator {
  static MovieVideosCubit videosCubit = di.sl<MovieVideosCubit>();
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case AppRoutes.initialRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const BottomNavBarScreen(),
        );
      case AppRoutes.seeAllScreen:
        return MaterialPageRoute(
          settings: RouteSettings(arguments: args as SeeAllScreenParams),
          builder: (BuildContext context) => SeeAllScreen(
            getMoviesFunc: args.getMoviesFunc,
            pageTitle: args.pageTitle,
          ),
        );
      case AppRoutes.paginatedScreen:
        return MaterialPageRoute(
          settings: RouteSettings(arguments: args as PaginatedScreenParams),
          builder: (BuildContext context) => PaginatedScreen(
            paginatedScreenParams: args,
          ),
        );
      case AppRoutes.movieDetailsScreen:
        return MaterialPageRoute(
          settings: RouteSettings(arguments: args as MovieEntity),
          builder: (BuildContext context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => di.sl<MovieDetailsCubit>()
                  ..getMovieDetailsByIdFunc(id: args.id),
              ),
              BlocProvider.value(
                value: videosCubit..getMovieVideosFunc(id: args.id),
              ),
              // BlocProvider(
              //   create: (context) =>
              //       videosCubit..getMovieVideosFunc(id: args.id),
              // ),
            ],
            child: MovieDetailsScreen(
              movieVideosCubit: videosCubit,
            ),
          ),
        );

      // case AppRoutes.movieVideosScreen:
      //   return MaterialPageRoute(
      //     settings: RouteSettings(arguments: args as int),
      //     builder: (BuildContext context) => BlocProvider.value(
      //       value: videosCubit..getMovieVideosFunc(id: args),
      //       child:  MovieVideosScreen(),
      //     ),
      //   );
      case AppRoutes.movieGalleryScreen:
        return MaterialPageRoute(
          settings: RouteSettings(arguments: args as MovieGalleryScreenParams),
          builder: (BuildContext context) => MovieGalleryScreen(
            movieGalleryScreenParams: args,
          ),
        );
      case AppRoutes.moviePhotoFullScreen:
        return MaterialPageRoute(
          settings:
              RouteSettings(arguments: args as MoviePhotoFullScreenParams),
          builder: (BuildContext context) => MoviePhotoFullScreen(
            moviePhotoFullScreenParams: args,
          ),
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(child: Text('unDefinedRoute')),
      ),
    );
  }
}


















// import 'package:go_router/go_router.dart';
// import 'package:movies_app/config/routes/app_routes_name.dart';
// import 'package:movies_app/features/home/presentation/screens/main_screen.dart';

// import '../../features/home/presentation/screens/home_screen.dart';
// import '../../features/profile/presentation/screens/profile_screen.dart';
// import '../../features/search/presentation/screens/search_screen.dart';
// import '../../features/videos/presentation/screens/videos_screen.dart';

// class AppRoute {
//   static final router = GoRouter(
//     //! make debugLogDiagnostics when releasing the app.
//     debugLogDiagnostics: true,
//     //  redirect: (context, state) {
//     //   // if the user was in the register screen and pressed on login.
//     //   final goToLoginPage = state.path == AppRoutePath.loginScreen;
//     //   if (AuthCubit.get(context).isSignedIn == false && goToLoginPage == true) {
//     //     return AppRoutePath.loginScreen;
//     //   }
//     //   // if the user was in the login screen and pressed on register.
//     //   final goToRegisterPage = state.path == AppRoutePath.registerScreen;
//     //   if (AuthCubit.get(context).isSignedIn == false &&
//     //       goToRegisterPage == true) {
//     //     return AppRoutePath.registerScreen;
//     //   }
//     //   return null;
//     // },
//     routes: [
//       GoRoute(
//         name: AppRoutesName.initialRoute,
//         path: '/',
//         builder: (context, state) => const MainScreen(),
//         routes: [
//           GoRoute(
//             name: AppRoutesName.homeScreen,
//             path: 'home',
//             builder: (context, state) => const HomeScreen(),
//           ),
//           GoRoute(
//             name: AppRoutesName.searchScreen,
//             path: 'search',
//             builder: (context, state) => const SearchScreen(),
//           ),
//           GoRoute(
//             name: AppRoutesName.videoScreen,
//             path: 'video',
//             builder: (context, state) => const VideosScreen(),
//           ),
//           GoRoute(
//             name: AppRoutesName.profileScreen,
//             path: 'profile',
//             builder: (context, state) => const ProfileScreen(),
//           ),
//         ],
//       ),
//     ],
//   );
// }
