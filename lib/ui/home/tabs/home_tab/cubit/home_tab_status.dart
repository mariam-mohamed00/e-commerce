import 'package:e_commerce/domain/entity/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';

abstract class HomeTabStates {}

class HomeTabCategoryInitialStat extends HomeTabStates {}

class HomeTabCategoryLoadingStat extends HomeTabStates {
  String? loadingMessage;

  HomeTabCategoryLoadingStat({required this.loadingMessage});
}

class HomeTabCategoryErrorStat extends HomeTabStates {
  Failures error;

  HomeTabCategoryErrorStat({required this.error});
}

class HomeTabCategorySuccessStat extends HomeTabStates {
  CategoryOrBrandResponseEntity categoryResponseEntity;

  HomeTabCategorySuccessStat({required this.categoryResponseEntity});
}

class HomeTabBrandInitialStat extends HomeTabStates {}

class HomeTabBrandLoadingStat extends HomeTabStates {
  String? loadingMessage;

  HomeTabBrandLoadingStat({required this.loadingMessage});
}

class HomeTabBrandErrorStat extends HomeTabStates {
  Failures error;

  HomeTabBrandErrorStat({required this.error});
}

class HomeTabBrandSuccessStat extends HomeTabStates {
  CategoryOrBrandResponseEntity brandResponseEntity;

  HomeTabBrandSuccessStat({required this.brandResponseEntity});
}
