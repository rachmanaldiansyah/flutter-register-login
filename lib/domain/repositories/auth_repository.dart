import 'package:flutter_register_login/data/dto/dto_signin_params.dart';
import 'package:flutter_register_login/data/dto/dto_signup_params.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either> signup(DtoSignUpParams signUpParams);
  Future<Either> signin(DtoSignInParams signInParams);
  Future<Either> getUser();
  Future<Either> logout();
  Future<bool> isLoggedIn();
}
