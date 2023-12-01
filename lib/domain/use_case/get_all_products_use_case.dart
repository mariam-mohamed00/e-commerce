import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/ProductResponseEntity.dart';
import 'package:e_commerce/domain/repository/repository/home_repository_contract.dart';

import '../failures.dart';

class GetAllProductsUseCase {
  HomeRepositoryContract repositoryContract;

  GetAllProductsUseCase({required this.repositoryContract});

  Future<Either<Failures, ProductResponseEntity>> invoke() {
    return repositoryContract.getProducts();
  }
}
