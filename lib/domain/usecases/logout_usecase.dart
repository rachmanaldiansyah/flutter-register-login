import 'package:dartz/dartz.dart';
import 'package:flutter_register_login/cores/usecases/usecase.dart';
import 'package:flutter_register_login/domain/repositories/auth_repository.dart';
import 'package:flutter_register_login/service_locator.dart';

class LogoutUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({param}) async {
    return await svcLocator<AuthRepository>().logout();
  }
}
