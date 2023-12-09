import 'package:e_commerce/ui/home/cart/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entity/GetCartResponseEntity.dart';
import '../../../../domain/use_case/delete_item_in_cart_use_case.dart';
import '../../../../domain/use_case/get_cart_use_case.dart';
import '../../../../domain/use_case/update_count_in_cart_use_case.dart';

class CartScreenViewModel extends Cubit<CartStates> {
  GetCartUseCase getCartUseCase;
  DeleteItemInCartUseCase deleteItemInCartUseCase;
  UpdateCountInCartUseCase updateCountInCartUseCase;

  CartScreenViewModel(
      {required this.getCartUseCase,
      required this.deleteItemInCartUseCase,
      required this.updateCountInCartUseCase})
      : super(CartInitialStates());

  List<GetProductEntity> productList = [];

  static CartScreenViewModel get(context) => BlocProvider.of(context);

  getCart() async {
    emit(CartLoadingStates(loadingMessage: 'Loading...'));
    var either = await getCartUseCase.invoke();
    either.fold((l) {
      emit(CartErrorStates(failures: l));
    }, (r) {
      productList = r.data?.products ?? [];
      emit(CartSuccessStates(cartResponseEntity: r));
    });
  }

  deleteItemInCart(String productId) async {
    emit(DeleteItemInCartLoadingStates(loadingMessage: 'Loading...'));
    var either = await deleteItemInCartUseCase.invoke(productId);
    either.fold((l) {
      emit(DeleteItemInCartErrorStates(failures: l));
    }, (r) {
      emit(CartSuccessStates(cartResponseEntity: r));
    });
  }

  updateCountInCart(String productId, int count) async {
    emit(UpdateCountInCartLoadingStates(loadingMessage: 'Loading...'));
    var either = await updateCountInCartUseCase.invoke(productId, count);
    either.fold((l) {
      emit(UpdateCountInCartErrorStates(failures: l));
    }, (r) {
      emit(CartSuccessStates(cartResponseEntity: r));
    });
  }
}
