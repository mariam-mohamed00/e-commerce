import 'package:e_commerce/ui/home/home_screen/cubit/home_screen_status.dart';
import 'package:e_commerce/ui/home/home_screen/cubit/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/custom_bottom_navigation_bar.dart';

class HomeScreenView extends StatelessWidget {
  static const String routeName = 'home screen';
  HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenViewModel, HomeScreenStatus>(
      bloc: viewModel,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            bottomNavigationBar: buildCustomBottomNavigationBar(
                context: context,
                selectedIndex: viewModel.selectedIndex,
                onTapFunction: (index) {
                  viewModel.changeBottomNavBar(index);
                }),
            body: viewModel.tabs[viewModel.selectedIndex]);
      },
    );
  }
}
