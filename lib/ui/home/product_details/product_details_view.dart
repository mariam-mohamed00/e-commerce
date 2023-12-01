import 'package:e_commerce/domain/entity/ProductResponseEntity.dart';
import 'package:e_commerce/ui/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsView extends StatelessWidget {
  static const String routeName = ' product details view';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as ProductEntity;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text('Product details'),
        backgroundColor: Colors.transparent,
        foregroundColor: MyTheme.primaryColor,
        titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: MyTheme.darkPrimaryColor),
        actions: [
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(Icons.search)),
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(color: Colors.grey, width: 2)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: ImageSlideshow(
                      initialPage: 0,
                      indicatorColor: MyTheme.primaryColor,
                      indicatorBackgroundColor: MyTheme.whiteColor,
                      indicatorBottomPadding: 20.h,
                      autoPlayInterval: 3000,
                      isLoop: true,
                      children: args.images!
                          .map((e) => Image.network(
                                e,
                                fit: BoxFit.fill,
                                height: 300.h,
                                width: double.infinity,
                              ))
                          .toList()),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    args.title ?? '',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: MyTheme.darkPrimaryColor,
                        ),
                  )),
                  Text(
                    'EGP ${args.price}',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: MyTheme.primaryColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 8.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            border: Border.all(
                                color: MyTheme.primaryColor, width: 1)),
                        child: Text(
                          'Sold : ${args.sold}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: MyTheme.primaryColor,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Image.asset('assets/images/star_icon.png'),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        '${args.ratingsAverage}',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: MyTheme.primaryColor,
                                fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
                  Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: MyTheme.primaryColor,
                        borderRadius: BorderRadius.circular(100.r)),
                    child: Row(
                      children: [
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove_circle_outline_rounded,
                              color: MyTheme.whiteColor,
                              size: 28.sp,
                            )),
                        Text(
                          '${args.quantity}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: MyTheme.whiteColor),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_circle_outline_rounded,
                              color: MyTheme.whiteColor,
                              size: 28.sp,
                            ))
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Description',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: MyTheme.darkPrimaryColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10.h,
              ),
              ReadMoreText(
                args.description ?? '',
                trimLines: 2,
                trimMode: TrimMode.Line,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: MyTheme.primaryColor.withOpacity(0.6)),
                trimCollapsedText: ' Show More',
                trimExpandedText: ' Show Less',
                moreStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: MyTheme.darkPrimaryColor.withOpacity(0.6),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500),
                lessStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: MyTheme.darkPrimaryColor.withOpacity(0.6),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 300.h,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Total Price',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: MyTheme.primaryColor, fontSize: 18.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'EGP ${args.price}',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: MyTheme.primaryColor,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 32.w,
                  ),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: MyTheme.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.add_shopping_cart_outlined),
                        Text(
                          'Add to cart',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: MyTheme.whiteColor),
                        )
                      ],
                    ),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
