import 'package:e_commerce/ui/home/tabs/home_tab/cubit/home_tab_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/entity/CategoryOrBrandResponseEntity.dart';
import '../../../../../domain/use_case/get_all_brands_use_case.dart';
import '../../../../../domain/use_case/get_all_categories_use_case.dart';

class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;

  HomeTabViewModel(
      {required this.getAllCategoriesUseCase,
      required this.getAllBrandsUseCase})
      : super(HomeTabBrandInitialStat());

  List<String> sliderImages = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
  ];

  List<CategoryOrBrandEntity> categoriesList = [];
  List<CategoryOrBrandEntity> brandsList = [];

  void getAllCategories() async {
    emit(HomeTabCategoryLoadingStat(loadingMessage: 'Loading...'));
    getAllCategoriesUseCase.invoke();
    var either = await getAllCategoriesUseCase.invoke();
    either.fold((l) {
      emit(HomeTabCategoryErrorStat(error: l));
    }, (r) {
      categoriesList = r.data ?? [];
      emit(HomeTabCategorySuccessStat(categoryResponseEntity: r));
    });
  }

  void getAllBrands() async {
    emit(HomeTabBrandLoadingStat(loadingMessage: 'Loading...'));
    getAllCategoriesUseCase.invoke();
    var either = await getAllBrandsUseCase.invoke();
    either.fold((l) {
      emit(HomeTabBrandErrorStat(error: l));
    }, (r) {
      brandsList = r.data ?? [];
      emit(HomeTabBrandSuccessStat(brandResponseEntity: r));
    });
  }
}
