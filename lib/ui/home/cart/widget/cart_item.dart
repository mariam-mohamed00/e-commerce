import 'package:e_commerce/ui/home/cart/cubit/cart_screen_view_model.dart';
import 'package:e_commerce/ui/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entity/GetCartResponseEntity.dart';

class CartItem extends StatelessWidget {
  GetProductEntity getProductEntity;

  CartItem({required this.getProductEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h, bottom: 18.h),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
                width: 1.w, color: MyTheme.darkPrimaryColor.withOpacity(0.6))),
        width: 398.w,
        height: 160.h,
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              height: 145.h,
              width: 130.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(
                      width: 1.w,
                      color: MyTheme.darkPrimaryColor.withOpacity(0.6))),
              child: Image.network(
                getProductEntity.product?.imageCover ?? '',
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: 8.w, right: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 200.w,
                          child: Text(
                            getProductEntity.product?.title ?? '',
                            // overflow: TextOverflow.clip,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            // width: 100,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: MyTheme.primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            CartScreenViewModel.get(context).deleteItemInCart(
                                getProductEntity.product?.id ?? '');
                          },
                          child: Icon(
                            Icons.delete_outline,
                            color: MyTheme.primaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 13.h, bottom: 13.h),
                    child: Text(
                      getProductEntity.count.toString(),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: MyTheme.blueGreyColor.withOpacity(0.6)),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(bottom: 14.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'EGP: ${getProductEntity.price}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: MyTheme.primaryColor,
                                  fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 42.h,
                          width: 122.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: MyTheme.primaryColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  int counter = getProductEntity.count!.toInt();
                                  counter--;
                                  CartScreenViewModel.get(context)
                                      .updateCountInCart(
                                          getProductEntity.product?.id ?? '',
                                          counter);
                                },
                                child: Icon(
                                  Icons.remove_circle_outline,
                                  size: 20.w,
                                  color: MyTheme.whiteColor,
                                ),
                              ),
                              Text(
                                '${getProductEntity.count}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: MyTheme.whiteColor),
                              ),
                              InkWell(
                                onTap: () {
                                  int counter = getProductEntity.count!.toInt();
                                  counter++;
                                  CartScreenViewModel.get(context)
                                      .updateCountInCart(
                                          getProductEntity.product?.id ?? '',
                                          counter);
                                },
                                child: Icon(
                                  Icons.add_circle_outline,
                                  size: 20.w,
                                  color: MyTheme.whiteColor,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
