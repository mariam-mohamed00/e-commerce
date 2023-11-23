import 'package:e_commerce/ui/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildCustomBottomNavigationBar(
    {required int selectedIndex,
    required Function(int) onTapFunction,
    required BuildContext context}) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
    child: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: MyTheme.primaryColor,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      currentIndex: selectedIndex,
      onTap: onTapFunction,
      items: [
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 0
                  ? MyTheme.primaryColor
                  : MyTheme.whiteColor,
              backgroundColor:
                  selectedIndex == 0 ? MyTheme.whiteColor : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                  size: 40.sp, const AssetImage('assets/images/home_icon.png')),
            ),
            label: "HOME"),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 1
                  ? MyTheme.primaryColor
                  : MyTheme.whiteColor,
              backgroundColor:
                  selectedIndex == 1 ? MyTheme.whiteColor : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                  size: 40.sp,
                  const AssetImage('assets/images/product_icon.png')),
            ),
            label: "PRODUCT"),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 2
                  ? MyTheme.primaryColor
                  : MyTheme.whiteColor,
              backgroundColor:
                  selectedIndex == 2 ? MyTheme.whiteColor : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                  size: 40.sp,
                  const AssetImage('assets/images/favorite_icon.png')),
            ),
            label: "FAVORITE"),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 3
                  ? MyTheme.primaryColor
                  : MyTheme.whiteColor,
              backgroundColor:
                  selectedIndex == 3 ? MyTheme.whiteColor : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                  size: 40.sp,
                  const AssetImage('assets/images/profile_icon.png')),
            ),
            label: "PROFILE"),
      ],
    ),
  );
}
