import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/utils.dart';

class WatchListButtonWidget extends StatefulWidget {
  const WatchListButtonWidget({
    super.key,
  });

  @override
  State<WatchListButtonWidget> createState() => _WatchListButtonWidgetState();
}

class _WatchListButtonWidgetState extends State<WatchListButtonWidget> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
          ),
          onPressed: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          },
          child: Text(
            isFavorite == true
                ? '✓ ${AppStrings.watchlist}'
                : '+ ${AppStrings.watchlist}',
            style: AppTextStyle.body12WhiteBold.copyWith(
              color: AppColors.blueColor,
            ),
          ),
        ),
      ),
    );
  }
}
