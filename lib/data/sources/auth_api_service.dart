import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_register_login/cores/constants/api_urls.dart';
import 'package:flutter_register_login/cores/network/dio_client.dart';
import 'package:flutter_register_login/data/dto/dto_signin_params.dart';
import 'package:flutter_register_login/data/dto/dto_signup_params.dart';
import 'package:flutter_register_login/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthApiService {
  Future<Either> signup(DtoSignUpParams signUpParams);
  Future<Either> signin(DtoSignInParams signInParams);
  Future<Either> getUser();
}

class AuthApiServiceImpl extends AuthApiService {
  @override
  Future<Either> getUser() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('data');
      var response = await svcLocator<DioClient>().get(ApiUrls.userProfile,
          options: Options(headers: {'Authorization': 'Bearer $token '}));

      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> signin(DtoSignInParams signInParams) async {
    try {
      final response = await svcLocator<DioClient>()
          .post(ApiUrls.userLogin, data: signInParams.toMap());

      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
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
