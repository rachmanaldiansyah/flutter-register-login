import 'package:dartz/dartz.dart';
import 'package:flutter_register_login/cores/usecases/usecase.dart';
import 'package:flutter_register_login/data/dto/dto_signin_params.dart';
import 'package:flutter_register_login/domain/repositories/auth_repository.dart';
import 'package:flutter_register_login/service_locator.dart';

class SigninUseCase implements UseCase<Either, DtoSignInParams> {
  @override
  Future<Either> call({DtoSignInParams? param}) async {
    return svcLocator<AuthRepository>().signin(param!);
  }
}
