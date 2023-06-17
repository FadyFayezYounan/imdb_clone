import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/utils.dart';

class WatchListButtonWidget extends StatefulWidget {
  const WatchListButtonWidget({
    Key? key,
  }) : super(key: key);

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
