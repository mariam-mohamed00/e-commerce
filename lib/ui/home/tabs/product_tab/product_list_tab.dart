import 'package:e_commerce/domain/di.dart';
import 'package:e_commerce/ui/home/tabs/home_tab/widgets/custom_search_with_shopping_cart.dart';
import 'package:e_commerce/ui/home/tabs/product_tab/cubit/product_tab_status.dart';
import 'package:e_commerce/ui/home/tabs/product_tab/cubit/product_tab_view_model.dart';
import 'package:e_commerce/ui/home/tabs/product_tab/widgets/grid_view_card_item.dart';
import 'package:e_commerce/ui/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../product_details/product_details_view.dart';

class ProductListTab extends StatelessWidget {
  ProductTabViewModel viewModel =
      ProductTabViewModel(getAllProductsUseCase: injectGetAllProductsUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductTabViewModel, ProductTabStates>(
      bloc: viewModel..getAllProducts(),
      builder: (context, state) {
        return SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Image.asset(
                'assets/images/route_logo.png',
                color: MyTheme.primaryColor,
              ),
              SizedBox(
                height: 18.h,
              ),
              CustomSearchWithShoppingCart(),
              SizedBox(
                height: 24.h,
              ),
              state is ProductTabInitialStat
                  ? Center(
                      child: CircularProgressIndicator(
                        color: MyTheme.primaryColor,
                      ),
                    )
                  : Expanded(
                      child: GridView.builder(
                      itemCount: viewModel.productsList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 2.4,
                          crossAxisSpacing: 16.w,
                          mainAxisSpacing: 16.h),
                      itemBuilder: (context, index) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Navigator.pushNamed(
                                context, ProductDetailsView.routeName,
                                arguments: viewModel.productsList[index]);
                          },
                          child: GridViewCardItem(
                            productEntity: viewModel.productsList[index],
                          ),
                        );
                      },
                    ))
            ],
          ),
        ));
      },
    );
  }
}
