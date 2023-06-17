import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text_style.dart';

class MovieCarouselItem extends StatelessWidget {
  const MovieCarouselItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      // height: 0.33.sh,
      color: AppColors.scaffoldBackgroundColor,
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
        final maxWidth = boxConstraints.maxWidth;
        final maxHeight = boxConstraints.maxHeight;

        return Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Positioned(
              top: 0,
              child: CarouselMovieTriller(
                width: maxWidth,
                height: maxHeight * 0.84,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.06),
                  child: CarouselMovieImageWidget(
                    height: maxHeight * 0.54, //maxHeight * 0.67,
                  ),
                ),
                SizedBox(
                  height: maxHeight * 0.2,
                  width: maxWidth * 0.46,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'movie name',
                        style: AppTextStyle.body16White,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                      ),
                      Text(
                        'movie name',
                        style: AppTextStyle.label14Grey,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        );
      }),
    );
  }
}

class CarouselMovieTriller extends StatelessWidget {
  const CarouselMovieTriller({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.network(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnn2zbUhWo6mxMN_rdU0ijOc945psFxtTXF0O20Me6TKM8TCYrp5jZ8cqK_2cewhKW3E0&usqp=CAU',
        fit: BoxFit.cover,
      ),
    );
  }
}

class CarouselMovieImageWidget extends StatelessWidget {
  const CarouselMovieImageWidget({
    Key? key,
    //required this.width,
    required this.height,
  }) : super(key: key);

  //final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: width * 0.06),
      //width: width * 0.33, // maxWidth * 0.42,
      height: height, //maxHeight * 0.67,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 16.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Image.network(
          'https://amc-theatres-res.cloudinary.com/image/upload/f_auto,fl_lossy,h_465,q_auto,w_310/v1667397461/amc-cdn/production/2/movies/53700/53699/PosterDynamic/145397.jpg'),
    );
  }
}
