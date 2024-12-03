import 'package:flutter_register_login/cores/network/dio_client.dart';
import 'package:flutter_register_login/data/repositories/auth_repository_impl.dart';
import 'package:flutter_register_login/data/sources/auth_api_service.dart';
import 'package:flutter_register_login/data/sources/auth_local_service.dart';
import 'package:flutter_register_login/domain/repositories/auth_repository.dart';
import 'package:flutter_register_login/domain/usecases/get_user_usecase.dart';
import 'package:flutter_register_login/domain/usecases/islogged_in_usecase.dart';
import 'package:flutter_register_login/domain/usecases/logout_usecase.dart';
import 'package:flutter_register_login/domain/usecases/signin_usecase.dart';
import 'package:flutter_register_login/domain/usecases/signup_usecase.dart';
import 'package:get_it/get_it.dart';

final svcLocator = GetIt.instance;

void setupServiceLocator() {
  // initialize dio client
  svcLocator.registerSingleton<DioClient>(DioClient());

  // service
  svcLocator.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  svcLocator.registerSingleton<AuthLocalService>(AuthLocalServiceImpl());

  // repositories
  svcLocator.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // usecase
  svcLocator.registerSingleton<SignupUseCase>(SignupUseCase());
  svcLocator.registerSingleton<SigninUseCase>(SigninUseCase());
  svcLocator.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  svcLocator.registerSingleton<GetUserUseCase>(GetUserUseCase());
  svcLocator.registerSingleton<LogoutUseCase>(LogoutUseCase());
}
