import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../widgets/app_loading_indicator.dart';
import 'loading_screen.dart';

class AnimatedLoading extends StatelessWidget {
  const AnimatedLoading({
    super.key,
    required this.isLoading,
    required this.child,
    this.isScreen = false,
  });
  final bool isLoading;
  final Widget child;
  final bool isScreen;

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      // duration: Duration(seconds: 3),
      transitionBuilder: (
        Widget transChild,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return SharedAxisTransition(
          animation: animation,
          fillColor: Colors.transparent,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.scaled,
          child: transChild,
        );
      },
      child: isLoading
          ? (isScreen ? const LoadingScreen() : const AppLoadingIndicator())
          : child,
    );
  }
}
