import 'package:e_commerce/ui/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: MyTheme.primaryColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(15.h),
        hintText: 'What do you search for?',
        hintStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          color: const Color.fromRGBO(6, 0, 79, 0.6),
        ),
        prefixIcon: IconButton(
          icon: Icon(
            Icons.search,
            size: 32.sp,
            color: MyTheme.primaryColor.withOpacity(0.75),
          ),
          onPressed: () {},
        ),
        border: buildBaseBorder(),
        enabledBorder: buildBaseBorder(),
        focusedBorder: buildBaseBorder(),
      ),
    );
  }

  OutlineInputBorder buildBaseBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.r),
        borderSide: BorderSide(color: MyTheme.primaryColor, width: 2));
  }
}
