import 'package:dartz/dartz.dart';
import 'package:flutter_register_login/cores/usecases/usecase.dart';
import 'package:flutter_register_login/data/dto/dto_signup_params.dart';
import 'package:flutter_register_login/domain/repositories/auth_repository.dart';
import 'package:flutter_register_login/service_locator.dart';

class SignupUseCase implements UseCase<Either, DtoSignUpParams> {
  @override
  Future<Either> call({DtoSignUpParams? param}) async {
    return svcLocator<AuthRepository>().signup(param ?? DtoSignUpParams());
  }
}
