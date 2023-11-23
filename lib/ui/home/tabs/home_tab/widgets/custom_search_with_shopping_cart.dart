import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/custom_text_field.dart';

class CustomSearchWithShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CustomTextField()),
        SizedBox(
          width: 24.w,
        ),
        InkWell(
          onTap: () {},
          child: ImageIcon(
            AssetImage('assets/images/shopping_cart_icon.png'),
            size: 27.sp,
          ),
        )
      ],
    );
  }
}
