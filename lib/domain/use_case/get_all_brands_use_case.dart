import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/repository/repository/home_repository_contract.dart';

import '../entity/CategoryOrBrandResponseEntity.dart';
import '../failures.dart';

class GetAllBrandsUseCase {
  HomeRepositoryContract repositoryContract;

  GetAllBrandsUseCase({required this.repositoryContract});

  Future<Either<Failures, CategoryOrBrandResponseEntity>> invoke() {
    return repositoryContract.getBrands();
  }
}
