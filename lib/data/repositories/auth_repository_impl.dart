import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_register_login/data/dto/dto_signin_params.dart';
import 'package:flutter_register_login/data/dto/dto_users.dart';
import 'package:flutter_register_login/data/sources/auth_local_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_register_login/data/dto/dto_signup_params.dart';
import 'package:flutter_register_login/data/sources/auth_api_service.dart';
import 'package:flutter_register_login/domain/repositories/auth_repository.dart';
import 'package:flutter_register_login/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> getUser() async {
    Either result = await svcLocator<AuthApiService>().getUser();
    return result.fold((error) => Left(error), (data) async {
      Response response = data;

      var userModel = DtoUserModel.fromMap(response.data);
      var userEntity = userModel.toEntity();

      return Right(userEntity);
    });
  }

  @override
  Future<bool> isLoggedIn() async {
    return await svcLocator<AuthLocalService>().isLoggedIn();
  }

  @override
  Future<Either> logout() async {
    return await svcLocator<AuthLocalService>().logout();
  }

  @override
  Future<Either> signin(DtoSignInParams signInParams) async {
    Either result = await svcLocator<AuthApiService>().signin(signInParams);
    return result.fold((error) => Left(error), (data) async {
      Response response = data;
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', response.data['data']);

      return Right(response);
    });
  }

  @override
  Future<Either> signup(DtoSignUpParams signUpParams) async {
    Either result = await svcLocator<AuthApiService>().signup(signUpParams);
    return result.fold((error) => Left(error), (data) async {
      Response response = data;

      return Right(response);
    });
  }
}
