import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/GetCartResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';

abstract class CartRepositoryContract {
  Future<Either<Failures, GetCartResponseEntity>> getCart();

  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(
      String productId);

  Future<Either<Failures, GetCartResponseEntity>> updateCountInCart(
      String productId, int count);
}
