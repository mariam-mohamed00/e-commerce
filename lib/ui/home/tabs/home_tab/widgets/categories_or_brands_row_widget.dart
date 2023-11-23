import 'package:e_commerce/ui/utils/my_theme.dart';
import 'package:flutter/material.dart';

class CategoriesOrBrandsRowWidget extends StatelessWidget {
  String name;

  CategoriesOrBrandsRowWidget({required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: MyTheme.darkPrimaryColor),
        ),
        InkWell(
          onTap: () {},
          child: Text(
            'View all',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: MyTheme.darkPrimaryColor),
          ),
        ),
      ],
    );
  }
}
