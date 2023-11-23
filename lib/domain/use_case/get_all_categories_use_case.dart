import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/repository/repository/home_repository_contract.dart';

import '../entity/CategoryOrBrandResponseEntity.dart';
import '../failures.dart';

class GetAllCategoriesUseCase {
  HomeRepositoryContract repositoryContract;

  GetAllCategoriesUseCase({required this.repositoryContract});

  Future<Either<Failures, CategoryOrBrandResponseEntity>> invoke() {
    return repositoryContract.getCategories();
  }
}
