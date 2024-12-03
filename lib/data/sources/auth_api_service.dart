import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_register_login/cores/constants/api_urls.dart';
import 'package:flutter_register_login/cores/network/dio_client.dart';
import 'package:flutter_register_login/data/dto/dto_signup_params.dart';
import 'package:flutter_register_login/service_locator.dart';

abstract class AuthApiService {
  Future<Either> signup(DtoSignUpParams signUpParams);
  Future<Either> signin(DtoSignUpParams signUpParams);
  Future<Either> getUser();
}

class AuthApiServiceImpl extends AuthApiService {
  @override
  Future<Either> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<Either> signin(DtoSignUpParams signUpParams) {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(DtoSignUpParams signUpParams) async {
    try {
      final response = await svcLocator<DioClient>()
          .post(ApiUrls.userRegister, data: signUpParams.toMap());

      return Right(response);
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ?? "Error For SignUp User.");
    }
  }
}
