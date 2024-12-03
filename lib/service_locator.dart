import 'package:flutter_register_login/cores/network/dio_client.dart';
import 'package:flutter_register_login/data/sources/auth_api_service.dart';
import 'package:flutter_register_login/domain/usecases/signup_usecase.dart';
import 'package:get_it/get_it.dart';

final svcLocator = GetIt.instance;

void setupServiceLocator() {
  // initialize dio client
  svcLocator.registerSingleton<DioClient>(DioClient());

  // service
  svcLocator.registerSingleton<AuthApiService>(AuthApiServiceImpl());

  // repositories
  svcLocator.registerSingleton<SignupUseCase>(SignupUseCase());
}
