import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class AddToWatchListClippedButton extends StatefulWidget {
  const AddToWatchListClippedButton({
    super.key,
    required this.width,
    required this.height,
    required this.onPressed,
    this.hideBorderRadius = false,
  });
  final double width;
  final double height;
  final VoidCallback onPressed;
  final bool hideBorderRadius;

  @override
  State<AddToWatchListClippedButton> createState() =>
      _AddToWatchListClippedButtonState();
}

class _AddToWatchListClippedButtonState
    extends State<AddToWatchListClippedButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipPath(),
      child: GestureDetector(
        onTap: () {
          widget.onPressed();
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        child: Container(
          width: widget.width, //maxWidth * 0.3,
          height: widget.height, //maxHeight * 0.14,
          decoration: BoxDecoration(
            color: isFavorite ? AppColors.primaryColor : Colors.black54,
            borderRadius: BorderRadius.only(
                topLeft: widget.hideBorderRadius
                    ? const Radius.circular(0.0)
                    : const Radius.circular(10.0)),
          ),
          child: Icon(
            isFavorite ? Icons.done_rounded : Icons.add_rounded,
            size: 28.0,
            color: isFavorite ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}

class MyCustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    final path = Path();
    path.lineTo(0, height);
    path.lineTo(width * 0.5, height * 0.86);
    path.lineTo(width, height);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
