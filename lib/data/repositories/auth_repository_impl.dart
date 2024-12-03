import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_register_login/data/dto/dto_signup_params.dart';
import 'package:flutter_register_login/data/sources/auth_api_service.dart';
import 'package:flutter_register_login/domain/repositories/auth_repository.dart';
import 'package:flutter_register_login/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<bool> isLoggedIn() {
    // TODO: implement isLoggedIn
    throw UnimplementedError();
  }

  @override
  Future<Either> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either> signin(DtoSignUpParams signInParams) {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(DtoSignUpParams signUpParams) async {
    Either result = await svcLocator<AuthApiService>().signup(signUpParams);
    return result.fold((error) => Left(error), (data) async {
      Response response = data;
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', response.data['token']);
      return Right(response);
    });
  }
}
