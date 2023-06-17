import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/utils.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_cast_and_crew_entity/cast_entity.dart';
import 'cast_image.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({super.key, required this.castEntity});
  final CastEntity castEntity;
  @override
  Widget build(BuildContext context) {
    final appOrientation = MediaQuery.of(context).orientation;
    return InkWell(
      onTap: () {},
      child: Container(
        width: appOrientation == Orientation.portrait ? 0.36.sw : 0.18.sw,
        margin: const EdgeInsets.only(
          right: 8.0,
          bottom: 8.0,
        ),
        decoration: BoxDecoration(
          color: AppColors.movieCardColor,
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadowColor,
              spreadRadius: 0.0,
              blurRadius: 16.0,
              offset: Offset(4.0, 8.0),
              blurStyle: BlurStyle.inner,
            ),
          ],
        ),
        child: LayoutBuilder(
          builder: (context, boxConstraints) {
            final maxWidth = boxConstraints.maxWidth;
            final maxHeight = boxConstraints.maxHeight;
            return Stack(
              alignment: Alignment.topLeft,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CastImage(
                      width: maxWidth,
                      height: maxHeight * 0.72,
                      castImage: castEntity.profilePath,
                      gender: castEntity.gender,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                        top: 8.0,
                      ),
                      child: Text(
                        castEntity.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
                    if (castEntity.character != null)
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 8.0,
                          bottom: 4.0,
                        ),
                        child: Text(
                          castEntity.character!,
                          style: AppTextStyle.label14Grey,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
