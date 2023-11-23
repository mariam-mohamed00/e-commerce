import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/auth_result_entity.dart';
import 'package:e_commerce/domain/failures.dart';

abstract class AuthRepositoryContract {
  Future<Either<Failures, AuthResultEntity>> register(String name, String email,
      String password, String rePassword, String phone);

  Future<Either<Failures, AuthResultEntity>> login(
    String email,
    String password,
  );
}
