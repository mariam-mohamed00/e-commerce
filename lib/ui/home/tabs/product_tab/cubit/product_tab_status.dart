import 'package:e_commerce/domain/entity/AddToCartResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';

import '../../../../../domain/entity/ProductResponseEntity.dart';

abstract class ProductTabStates {}

class ProductTabInitialStat extends ProductTabStates {}

class ProductTabLoadingStat extends ProductTabStates {
  String? loadingMessage;

  ProductTabLoadingStat({required this.loadingMessage});
}
class ProductTabErrorStat extends ProductTabStates {
  Failures error;

  ProductTabErrorStat({required this.error});
}

class ProductTabSuccessStat extends ProductTabStates {
  ProductResponseEntity productResponseEntity;

  ProductTabSuccessStat({required this.productResponseEntity});
}

class AddToCartLoadingStat extends ProductTabStates {
  String? loadingMessage;

  AddToCartLoadingStat({required this.loadingMessage});
}

class AddToCartErrorStat extends ProductTabStates {
  Failures error;

  AddToCartErrorStat({required this.error});
}

class AddToCartSuccessStat extends ProductTabStates {
  AddToCartResponseEntity addToCartResponseEntity;

  AddToCartSuccessStat({required this.addToCartResponseEntity});
}