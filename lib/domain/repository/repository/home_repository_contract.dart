import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';

abstract class HomeRepositoryContract {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getCategories();

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getBrands();
}
