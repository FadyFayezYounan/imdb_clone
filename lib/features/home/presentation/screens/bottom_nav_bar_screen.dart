import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/config/routes/route_generator.dart';
import 'package:movies_app/config/routes/app_routes.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/features/home/presentation/screens/home_screen.dart';
import 'package:movies_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:movies_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:movies_app/features/search/presentation/screens/search_screen_with_categories.dart';
import 'package:movies_app/features/videos/presentation/screens/videos_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:movies_app/app_injector.dart' as di;

import '../cubit/home_cubit.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  List<Widget> buildScreens() => [
        BlocProvider(
          create: (context) => di.sl<HomeCubit>()..getHomeScreenMovies(),
          child: const HomeScreen(),
        ),
        const SearchScreenWithCategories(),
        const VideosScreen(),
        const ProfileScreen(),
      ];
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_rounded),
        title: "Home",
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: const RouteAndNavigatorSettings(
          initialRoute: AppRoutes.initialRoute,
          onGenerateRoute: RouteGenerator.getRoute,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search_rounded),
        title: "Search",
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: const RouteAndNavigatorSettings(
          //initialRoute: AppRoutes.initialRoute,
          onGenerateRoute: RouteGenerator.getRoute,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.play_circle_rounded),
        title: "Video",
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.grey,
        // routeAndNavigatorSettings:
        //     const RouteAndNavigatorSettings(initialRoute: '/video'),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.account_circle_rounded),
        title: "You",
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.grey,
        // routeAndNavigatorSettings:
        //     const RouteAndNavigatorSettings(initialRoute: '/profile'),
      ),
    ];
  }

  late PersistentTabController _bottomNavBarController;

  @override
  void initState() {
    super.initState();
    _bottomNavBarController = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _bottomNavBarController,
      screens: buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: AppColors.navBarColor, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      // decoration: NavBarDecoration(
      //   borderRadius: BorderRadius.circular(10.0),
      //   colorBehindNavBar: Colors.white,
      // ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
      //style6
      //style8
    );
  }
}
