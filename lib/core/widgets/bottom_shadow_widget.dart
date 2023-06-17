import 'package:flutter/material.dart';

class BottomShadowWidget extends StatelessWidget {
  const BottomShadowWidget({
    super.key,
    required this.child,
    this.topRadius = 0.0,
    this.bottomRadius = 0.0,
  });
  final Widget child;
  final double topRadius;
  final double bottomRadius;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topRadius),
          topRight: Radius.circular(topRadius),
          bottomLeft: Radius.circular(bottomRadius),
          bottomRight: Radius.circular(bottomRadius),
        ),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black38,
            Colors.black,
          ],
        ),
      ),
      position: DecorationPosition.foreground,
      child: child,
    );
  }
}
