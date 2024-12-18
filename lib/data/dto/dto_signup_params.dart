class DtoSignUpParams {
  final String email;
  final String username;
  final String password;
  final String passwordConfirm;

  DtoSignUpParams({
    required this.email,
    required this.username,
    required this.password,
    required this.passwordConfirm,
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
