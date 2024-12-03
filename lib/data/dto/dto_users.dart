import 'package:flutter_register_login/domain/entities/user_entity.dart';

class DtoUserModel {
  final String email;
  final String username;

  DtoUserModel({required this.email, required this.username});

  factory DtoUserModel.fromMap(Map<String, dynamic> map) {
    return DtoUserModel(
      email: map['email'] as String,
      username: map['username'] as String,
    );
  }
}

extension UserXModel on DtoUserModel {
  UserEntity toEntity() {
    return UserEntity(email: email, username: username);
  }
}
