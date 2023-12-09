import 'package:e_commerce/domain/di.dart';
import 'package:e_commerce/ui/home/cart/cubit/cart_screen_view_model.dart';
import 'package:e_commerce/ui/home/cart/cubit/cart_states.dart';
import 'package:e_commerce/ui/home/cart/widget/cart_item.dart';
import 'package:e_commerce/ui/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = 'cart screen';

  CartScreenViewModel viewModel = CartScreenViewModel(
      getCartUseCase: injectGetCartUseCase(),
      deleteItemInCartUseCase: injectDeleteItemInCartUseCase(),
      updateCountInCartUseCase: injectUpdateCountInCartUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartScreenViewModel>(
      create: (context) => viewModel..getCart(),
      child: BlocBuilder<CartScreenViewModel, CartStates>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: MyTheme.primaryColor,
                  ),
                ),
                title: Text(
                  'Cart',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: MyTheme.primaryColor),
                ),
              ),
              body: state is CartSuccessStates
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: ListView.builder(
                          itemBuilder: (context, index) {
                            return CartItem(
                                getProductEntity: state
                                    .cartResponseEntity.data!.products![index]);
                          },
                          itemCount:
                              state.cartResponseEntity.numOfCartItems!.toInt(),
                        )),
                        Padding(
                            padding: EdgeInsets.only(
                                bottom: 98.h,
                                left: 16.w,
                                right: 16.w,
                                top: 12.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 12.h),
                                    child: Text(
                                      'Total Price',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              color: MyTheme.darkPrimaryColor
                                                  .withOpacity(0.6)),
                                    ),
                                  ),
                                  Text(
                                    'EGP ${state.cartResponseEntity.data!.totalCartPrice}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(color: MyTheme.primaryColor),
                                  ),
                                ]),
                                InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 48.h,
                                      width: 270.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          color: MyTheme.primaryColor),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 12.h, bottom: 12.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 83.w),
                                              child: Text(
                                                'Check out',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith(
                                                        color:
                                                            MyTheme.whiteColor),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 27.w, right: 32.w),
                                              child: Icon(
                                                Icons.arrow_forward,
                                                size: 20.w,
                                                color: MyTheme.whiteColor,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ))
                              ],
                            ))
                      ],
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: MyTheme.primaryColor,
                      ),
                    ));
        },
      ),
    );
  }
}
