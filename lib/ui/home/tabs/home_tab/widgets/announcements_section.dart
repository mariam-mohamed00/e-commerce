import 'package:e_commerce/ui/home/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:e_commerce/ui/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnnouncementsSection extends StatelessWidget {
  List<String> sliderImages = [];

  AnnouncementsSection({required this.sliderImages});

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      initialPage: 0,
      indicatorColor: MyTheme.primaryColor,
      indicatorBackgroundColor: MyTheme.whiteColor,
      indicatorBottomPadding: 18.h,
      autoPlayInterval: 3000,
      indicatorPadding: 12,
      indicatorRadius: 3,
      isLoop: true,
      children: sliderImages
          .map((e) => Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  e,
                  fit: BoxFit.fill,
                  width: 398.w,
                  height: 200.h,
                ),
              ))
          .toList(),
    );
  }
}
