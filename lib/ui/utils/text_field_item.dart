import 'package:e_commerce/ui/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldItem extends StatelessWidget {
  String fieldName;
  String hintText;
  Widget? suffixIcon;
  bool isObscure;
  var KeyboardType;
  String? Function(String?)? validator;
  TextEditingController controller;

  TextFieldItem(
      {required this.fieldName,
      required this.hintText,
      this.suffixIcon,
      this.isObscure = false,
      this.KeyboardType = TextInputType.text,
      this.validator,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: MyTheme.whiteColor),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
          child: TextFormField(
            obscureText: isObscure,
            controller: controller,
            validator: validator,
            keyboardType: KeyboardType,
            decoration: InputDecoration(
              filled: true,
              fillColor: MyTheme.whiteColor,
              hintText: hintText,
              suffixIconColor: MyTheme.hintText.withOpacity(0.7),
              suffixIcon: suffixIcon,
              hintStyle: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: MyTheme.hintText.withOpacity(0.7)),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
              focusedErrorBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
              errorBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
            ),
          ),
        )
      ],
    );
  }
}
