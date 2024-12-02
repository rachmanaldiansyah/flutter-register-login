class DtoSignUpParams {
  String? email;
  String? username;
  String? password;
  String? passwordConfirm;

  DtoSignUpParams({
    this.email,
    this.username,
    this.password,
    this.passwordConfirm,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': username,
      'email': email,
      'password': password,
      'password_confirm': passwordConfirm,
    };
  }
}
