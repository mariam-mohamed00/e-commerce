import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/repository/repository/home_repository_contract.dart';

import '../entity/AddToCartResponseEntity.dart';
import '../failures.dart';

class AddToCartUseCase {
  HomeRepositoryContract repositoryContract;

  AddToCartUseCase({required this.repositoryContract});

  Future<Either<Failures, AddToCartResponseEntity>> invoke(String productId) {
    return repositoryContract.addToCart(productId);
  }
}
