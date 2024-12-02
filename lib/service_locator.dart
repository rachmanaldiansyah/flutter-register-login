import 'package:flutter_register_login/cores/network/dio_client.dart';
import 'package:get_it/get_it.dart';

final svcLocator = GetIt.instance;

void setupServiceLocator() {
  // initialize dio client
  svcLocator.registerSingleton<DioClient>(DioClient());
}
