import 'package:e_commerce/ui/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../domain/entity/ProductResponseEntity.dart';

class GridViewCardItem extends StatelessWidget {
  bool isWishlisted = false;
  ProductEntity productEntity;

  GridViewCardItem({required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      height: 237.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: MyTheme.primaryColor, width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.network(
                  productEntity.imageCover ?? "",
                  fit: BoxFit.contain,
                  width: 191.w,
                  height: 128.h,
                ),
              ),
              Positioned(
                  top: 5.h,
                  right: 2.w,
                  child: CircleAvatar(
                    backgroundColor: MyTheme.whiteColor,
                    radius: 15,
                    child: IconButton(
                      color: MyTheme.primaryColor,
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: isWishlisted == true
                          ? Icon(Icons.favorite_rounded)
                          : Icon(Icons.favorite_border_rounded),
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Text(
                productEntity.title ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 12.sp,
                    color: MyTheme.darkPrimaryColor,
                    fontWeight: FontWeight.w500),
              )),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Row(
              children: [
                Text(
                  'EGP ${productEntity.price}',
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 14.sp,
                      color: MyTheme.darkPrimaryColor,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w, right: 8.w),
            child: Row(
              children: [
                Text(
                  'Review ${productEntity.ratingsAverage}',
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 14.sp,
                      color: MyTheme.darkPrimaryColor,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 7.w,
                ),
                Image.asset('assets/images/star_icon.png'),
                Spacer(
                  flex: 1,
                ),
                InkWell(
                  onTap: () {},
                  splashColor: Colors.transparent,
                  child: Icon(
                    Icons.add_circle,
                    size: 32.sp,
                    color: MyTheme.primaryColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
