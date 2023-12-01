import 'package:e_commerce/domain/use_case/get_all_products_use_case.dart';
import 'package:e_commerce/ui/home/tabs/product_tab/cubit/product_tab_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/entity/ProductResponseEntity.dart';

class ProductTabViewModel extends Cubit<ProductTabStates> {
  GetAllProductsUseCase getAllProductsUseCase;

  ProductTabViewModel({required this.getAllProductsUseCase})
      : super(ProductTabInitialStat());

  List<ProductEntity> productsList = [];

  void getAllProducts() async {
    emit(ProductTabLoadingStat(loadingMessage: 'Loading...'));
    getAllProductsUseCase.invoke();
    var either = await getAllProductsUseCase.invoke();
    either.fold((l) {
      emit(ProductTabErrorStat(error: l));
    }, (r) {
      productsList = r.data ?? [];
      emit(ProductTabSuccessStat(productResponseEntity: r));
    });
  }
}
