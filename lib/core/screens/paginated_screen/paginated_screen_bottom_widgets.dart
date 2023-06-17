part of 'paginated_screen.dart';

class _PaginatedScreenBottomWidget extends StatelessWidget {
  const _PaginatedScreenBottomWidget({
    required this.showLoading,
    required this.errorMessage,
    required this.onTryAgainPressed,
  });
  final bool showLoading;
  final String? errorMessage;
  final VoidCallback onTryAgainPressed;

  @override
  Widget build(BuildContext context) {
    return errorMessage != null
        ? _ErrorWidget(
            error: errorMessage,
            onPressed: onTryAgainPressed,
          )
        : showLoading
            ? const _LoadingWidget()
            : const _NoMoreMoviesWidget();
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 16.0,
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          children: [
            const CircularProgressIndicator.adaptive(),
            const SizedBox(
              width: 16.0,
            ),
            Text(
              AppStrings.loading,
              style: AppTextStyle.body16White,
            ),
          ],
        ),
      ),
    );
  }
}

class _NoMoreMoviesWidget extends StatelessWidget {
  const _NoMoreMoviesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 16.0,
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          children: [
            Image.asset(
              AppImages.emptyBox,
              width: 32.0,
              height: 32.0,
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              'No more movies.',
              style: AppTextStyle.body16White.copyWith(
                color: AppColors.lightGreyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({
    Key? key,
    required this.error,
    required this.onPressed,
  }) : super(key: key);
  final String? error;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 16.0,
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$error. Tap to try again.',
                style: AppTextStyle.body16White,
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Icon(
                Icons.refresh,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
