import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/routes/app_navigator.dart';
import 'package:movies_app/config/routes/app_routes.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

import 'package:movies_app/features/home/presentation/widgets/main_movies/main_movie_item_widget.dart';

import '../../../../../core/utils/utils.dart';

class MainMoviesCarouselListWidget extends StatefulWidget {
  const MainMoviesCarouselListWidget({
    super.key,
    required this.nowPlayingMoviesList,
  });
  final List<MovieEntity> nowPlayingMoviesList;

  @override
  State<MainMoviesCarouselListWidget> createState() =>
      _MainMoviesCarouselListWidgetState();
}

class _MainMoviesCarouselListWidgetState
    extends State<MainMoviesCarouselListWidget> {
  void _goToDetailsScreen(index) {
    AppNavigator.navigateNamedTo(
      context,
      AppRoutes.movieDetailsScreen,
      arguments: widget.nowPlayingMoviesList[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 10,
      itemBuilder: (context, index, realIndex) {
        return GestureDetector(
          onTap: () => _goToDetailsScreen(index),
          child: MainMovieItemWidget(
            currentMovie: widget.nowPlayingMoviesList[index],
            onPlayPressed: () => _goToDetailsScreen(index),
          ),
        );
      },
      options: CarouselOptions(
        height: context.isPortrait ? 0.38.sh : 0.76.sh,
        aspectRatio: 16 / 9,
        viewportFraction: 1.0,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        //onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
