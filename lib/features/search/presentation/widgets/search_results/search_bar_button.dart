import 'package:flutter/material.dart';

import '../../../../../core/utils/utils.dart';

class SearchBarButton extends StatelessWidget {
  const SearchBarButton({
    super.key,
    this.onSearchBarButtonPressed,
    this.enabled = false,
    this.controller,
    this.focusNode,
    this.onChanged,
  });
  final TextEditingController? controller;
  final VoidCallback? onSearchBarButtonPressed;
  final bool enabled;
  final FocusNode? focusNode;
  final void Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSearchBarButtonPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          enabled: enabled,
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search_rounded,
              color: AppColors.scaffoldBackgroundColor,
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: 'Search IMDb',
            hintStyle: AppTextStyle.body16White.copyWith(
              color: AppColors.scaffoldBackgroundColor,
            ),
            suffixIcon: controller != null
                ? Material(
                    color: Colors.transparent,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close_rounded,
                        color: AppColors.scaffoldBackgroundColor,
                      ),
                      onPressed: () {
                        if (controller!.text.trim().isNotEmpty) {
                          controller!.clear();
                        }
                      },
                    ),
                  )
                : null,
          ),
          style: const TextStyle(
            color: AppColors.scaffoldBackgroundColor,
          ),
        ),
      ),
    );
  }
}
