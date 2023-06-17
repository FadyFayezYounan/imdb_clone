import 'package:flutter/material.dart';

class MovieMoreInfoButtonWidget extends StatelessWidget {
  const MovieMoreInfoButtonWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Material(
          color: Colors.transparent,
          child: SizedBox(
            child: InkWell(
              onTap: onPressed,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(10.0),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 6.0,
                ),
                child: Icon(
                  Icons.info_outline_rounded,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
