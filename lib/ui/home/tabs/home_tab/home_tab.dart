import 'package:e_commerce/domain/di.dart';
import 'package:e_commerce/ui/home/tabs/home_tab/cubit/home_tab_status.dart';
import 'package:e_commerce/ui/home/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:e_commerce/ui/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/announcements_section.dart';
import 'widgets/categories_or_brands_row_widget.dart';
import 'widgets/categories_section.dart';
import 'widgets/custom_search_with_shopping_cart.dart';

class HomeTab extends StatelessWidget {
  HomeTabViewModel viewModel = HomeTabViewModel(
      getAllCategoriesUseCase: injectGetAllCategoriesUseCase(),
      getAllBrandsUseCase: injectGetAllBrandsUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
      bloc: viewModel
        ..getAllCategories()
        ..getAllBrands(),
      builder: (context, state) {
        return SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: SingleChildScrollView(
            child: Column(
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
                  height: 16.h,
                ),
                AnnouncementsSection(
                  sliderImages: viewModel.sliderImages,
                ),
                SizedBox(
                  height: 16.h,
                ),
                CategoriesOrBrandsRowWidget(
                  name: 'Categories',
                ),
                SizedBox(
                  height: 24.h,
                ),
                state is HomeTabBrandLoadingStat
                    ? Center(
                        child: CircularProgressIndicator(
                          color: MyTheme.primaryColor,
                        ),
                      )
                    : CategoriesSection(list: viewModel.categoriesList),
                SizedBox(
                  height: 24.h,
                ),
                CategoriesOrBrandsRowWidget(
                  name: 'Brands',
                ),
                SizedBox(
                  height: 20.h,
                ),
                state is HomeTabBrandLoadingStat
                    ? Center(
                        child: CircularProgressIndicator(
                          color: MyTheme.primaryColor,
                        ),
                      )
                    : CategoriesSection(list: viewModel.brandsList),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ));
      },
    );
  }
}
