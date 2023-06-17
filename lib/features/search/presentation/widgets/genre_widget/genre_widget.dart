import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/widgets/app_cached_network_image_widget.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity/genre_entity.dart';

import '../../../../../config/routes/app_navigator.dart';
import '../../../../../config/routes/app_routes.dart';
import '../../../../home/domain/entities/see_all_screen_params.dart';

class GenreWidget extends StatelessWidget {
  const GenreWidget({
    super.key,
    required this.genreEntity,
    required this.onPressed,
  });

  final GenreEntity genreEntity;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
            color: AppColors.containerColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (_movieGenreImage != null)
                  Expanded(
                    flex: 3,
                    child: Stack(
                      children: [
                        AppCachedNetworkImage(
                          width: double.infinity,
                          height: double.infinity,
                          loadingIcon: Icons.theaters_rounded,
                          imageUrl: _movieGenreImage!,
                          borderRadius: BorderRadius.circular(10.0),
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        )
                      ],
                    ),
                  ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(genreEntity.name),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? get _movieGenreImage {
    switch (genreEntity.name) {
      case 'Action':
        return 'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/r17jFHAemzcWPPtoO0UxjIX0xas.jpg';
      case 'Adventure':
        return 'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/mDfJG3LC3Dqb67AZ52x3Z0jU0uB.jpg';
      case 'Animation':
        return 'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/uT5G4fA7jKxlJNfwYPMm353f5AI.jpg';
      case 'Comedy':
        return 'https://www.themoviedb.org/t/p/original/iqzwGNs4abeKDuAUM1lhIHAtoMb.jpg';
      case 'Crime':
        return 'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/dKqa850uvbNSCaQCV4Im1XlzEtQ.jpg';
      case 'Documentary':
        return 'https://www.themoviedb.org/t/p/w500_and_h282_face/6S159wVNvQfwoQh5yBxWKCsI1YL.jpg';
      case 'Drama':
        return 'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/v4yVTbbl8dE1UP2dWu5CLyaXOku.jpg';
      case 'Family':
        return 'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/hVMoqvXs5j9ffun56tZ5YhliSD9.jpg';
      case 'Fantasy':
        return 'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/xDMIl84Qo5Tsu62c9DGWhmPI67A.jpg';
      case 'History':
        return 'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/254iY5CzFzjnjkP0lUkLpOLvXar.jpg';
      case 'Horror':
        return 'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/s9tI8lGQpmWRNsh7aSrPfMQjGQv.jpg';
      case 'Music':
        return 'https://www.themoviedb.org/t/p/w500_and_h282_face/2wmDyHz4gvF6m51IQZJnJzlLsnz.jpg';
      case 'Mystery':
        return 'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/jr8tSoJGj33XLgFBy6lmZhpGQNu.jpg';
      case 'Romance':
        return 'https://www.themoviedb.org/t/p/original/sS4MadD7pKMt251vKxdJo2YrkYP.jpg';
      case 'Science Fiction':
        return 'https://www.themoviedb.org/t/p/w500_and_h282_face/AlIFUGFzxzb7G5KJWxShv1034No.jpg';
      case 'TV Movie':
        return 'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/8PDhVLK9dZ3kTwAJ4MWpbjL0oJa.jpg';
      case 'Thriller':
        return 'https://www.themoviedb.org/t/p/original/4ke48uabb0K6uDcLlSED2ZvvYEb.jpg';
      case 'War':
        return 'https://www.themoviedb.org/t/p/w500_and_h282_face/76LpPdXtCf4WxWDagVT2YcF4e9g.jpg';
      case 'Western':
        return 'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/3uM41OT0RfBkE6Gb6U89LEskJBr.jpg';
      default:
        return null;
    }
  }
}
