import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/GetCartResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';
import 'package:e_commerce/domain/repository/repository/cart_repository_contract.dart';

class DeleteItemInCartUseCase {
  CartRepositoryContract cartRepositoryContract;

  DeleteItemInCartUseCase({required this.cartRepositoryContract});

  Future<Either<Failures, GetCartResponseEntity>> invoke(String productId) {
    return cartRepositoryContract.deleteItemInCart(productId);
  }
}
