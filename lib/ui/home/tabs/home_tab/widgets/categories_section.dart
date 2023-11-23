import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../domain/entity/CategoryOrBrandResponseEntity.dart';
import 'category_item.dart';

class CategoriesSection extends StatelessWidget {
  List<CategoryOrBrandEntity> list;

  CategoriesSection({required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      child: GridView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, intdex) {
          return CategoryItem(
            categoryEntity: list[intdex],
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
      ),
    );
  }
}
