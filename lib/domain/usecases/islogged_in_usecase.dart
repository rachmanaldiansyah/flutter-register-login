import 'package:flutter_register_login/cores/usecases/usecase.dart';
import 'package:flutter_register_login/domain/repositories/auth_repository.dart';
import 'package:flutter_register_login/service_locator.dart';

class IsLoggedInUseCase implements UseCase<bool, dynamic> {
  @override
  Future<bool> call({dynamic param}) async {
    return svcLocator<AuthRepository>().isLoggedIn();
  }
}
