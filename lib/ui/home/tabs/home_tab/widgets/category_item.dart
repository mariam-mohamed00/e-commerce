import 'package:e_commerce/domain/entity/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce/ui/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  CategoryOrBrandEntity categoryEntity;

  CategoryItem({required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 8,
            child: CircleAvatar(
              backgroundImage: NetworkImage(categoryEntity.image ?? ''),
              radius: 50.r,
            )),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
            flex: 2,
            child: Text(
              categoryEntity.name ?? '',
              textWidthBasis: TextWidthBasis.longestLine,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: MyTheme.primaryColor),
            )),
      ],
    );
  }
}
