import 'package:e_commerce/domain/use_case/get_all_products_use_case.dart';
import 'package:e_commerce/ui/home/tabs/product_tab/cubit/product_tab_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/entity/ProductResponseEntity.dart';
import '../../../../../domain/use_case/add_to_cart_use_case.dart';

class ProductTabViewModel extends Cubit<ProductTabStates> {
  GetAllProductsUseCase getAllProductsUseCase;
  AddToCartUseCase addToCartUseCase;

  ProductTabViewModel(
      {required this.getAllProductsUseCase, required this.addToCartUseCase})
      : super(ProductTabInitialStat());

  List<ProductEntity> productsList = [];
  int numOfCartItems = 0;

  static ProductTabViewModel get(context) => BlocProvider.of(context);

  void getAllProducts() async {
    emit(ProductTabLoadingStat(loadingMessage: 'Loading...'));
    var either = await getAllProductsUseCase.invoke();
    either.fold((l) {
      emit(ProductTabErrorStat(error: l));
    }, (r) {
      productsList = r.data ?? [];
      emit(ProductTabSuccessStat(productResponseEntity: r));
    });
  }

  void addToCart(String productId) async {
    emit(AddToCartLoadingStat(loadingMessage: 'Loading...'));
    var either = await addToCartUseCase.invoke(productId);
    either.fold((l) {
      emit(AddToCartErrorStat(error: l));
    }, (r) {
      numOfCartItems = r.numOfCartItems?.toInt() ?? 0;
      // print('----------------');
      print('num of items: $numOfCartItems');
      emit(AddToCartSuccessStat(addToCartResponseEntity: r));
    });
  }
}
