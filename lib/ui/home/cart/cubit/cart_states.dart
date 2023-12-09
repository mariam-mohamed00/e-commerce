import 'package:e_commerce/domain/entity/GetCartResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';

abstract class CartStates {}

class CartInitialStates extends CartStates {}

class CartLoadingStates extends CartStates {
  String? loadingMessage;

  CartLoadingStates({required this.loadingMessage});
}

class CartErrorStates extends CartStates {
  Failures failures;

  CartErrorStates({required this.failures});
}

class CartSuccessStates extends CartStates {
  GetCartResponseEntity cartResponseEntity;

  CartSuccessStates({required this.cartResponseEntity});
}

class DeleteItemInCartLoadingStates extends CartStates {
  String? loadingMessage;

  DeleteItemInCartLoadingStates({required this.loadingMessage});
}

class DeleteItemInCartErrorStates extends CartStates {
  Failures failures;

  DeleteItemInCartErrorStates({required this.failures});
}

class DeleteItemInCartSuccessStates extends CartStates {
  GetCartResponseEntity cartResponseEntity;

  DeleteItemInCartSuccessStates({required this.cartResponseEntity});
}

class UpdateCountInCartLoadingStates extends CartStates {
  String? loadingMessage;

  UpdateCountInCartLoadingStates({required this.loadingMessage});
}

class UpdateCountInCartErrorStates extends CartStates {
  Failures failures;

  UpdateCountInCartErrorStates({required this.failures});
}

class UpdateCountInCartSuccessStates extends CartStates {
  GetCartResponseEntity cartResponseEntity;

  UpdateCountInCartSuccessStates({required this.cartResponseEntity});
}
