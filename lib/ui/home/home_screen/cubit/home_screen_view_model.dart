import 'package:e_commerce/ui/home/home_screen/cubit/home_screen_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../tabs/favorite_tab/favorite_tab.dart';
import '../../tabs/home_tab/home_tab.dart';
import '../../tabs/product_tab/product_list_tab.dart';
import '../../tabs/profile_tab/profile_tab.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStatus> {
  HomeScreenViewModel() : super(HomeScreenInitialState());

  // hold data - handle logic
  int selectedIndex = 0;

  List<Widget> tabs = [
    HomeTab(),
    ProductListTab(),
    FavoriteTab(),
    ProfileTab()
  ];

  void changeBottomNavBar(int newSelectedIndex) {
    HomeScreenInitialState();
    selectedIndex = newSelectedIndex;
    emit(ChangeBottomNavigationBar());
  }
}
