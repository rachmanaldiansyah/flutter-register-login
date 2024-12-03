import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_register_login/common/bloc/button/button_state.dart';
import 'package:flutter_register_login/common/bloc/button/button_state_cubit.dart';
import 'package:flutter_register_login/common/widgets/button/basic_app_button.dart';
import 'package:flutter_register_login/data/dto/dto_signin_params.dart';
import 'package:flutter_register_login/domain/usecases/signin_usecase.dart';
import 'package:flutter_register_login/presentation/auth/pages/signup_page.dart';
import 'package:flutter_register_login/presentation/home/pages/home_page.dart';
import 'package:flutter_register_login/service_locator.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonSuccessState) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            }
            if (state is ButtonFailureState) {
              var snackBar = SnackBar(content: Text(state.errorMessage));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: SafeArea(
            minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _signin(),
                  const SizedBox(height: 50),
                  _emailField(),
                  const SizedBox(height: 20),
                  _password(),
                  const SizedBox(height: 60),
                  _createAccountButton(context),
                  const SizedBox(height: 20),
                  _signupText(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _signin() {
    return const Text(
      'Sign In',
      style: TextStyle(
          color: Color(0xff2A4ECA), fontWeight: FontWeight.bold, fontSize: 32),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(hintText: 'Email'),
    );
  }

  Widget _password() {
    return TextField(
      controller: _passwordCon,
      decoration: const InputDecoration(hintText: 'Password'),
    );
  }

  Widget _createAccountButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicAppButton(
          title: 'Login',
          onPressed: () {
            context.read<ButtonStateCubit>().excute(
                  usecase: svcLocator<SigninUseCase>(),
                  params: DtoSignInParams(
                    email: _emailCon.text,
                    password: _passwordCon.text,
                  ),
                );
          });
    });
  }

  Widget _signupText(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        const TextSpan(
            text: "Don't you have account?",
            style: TextStyle(
                color: Color(0xff3B4054), fontWeight: FontWeight.w500)),
        TextSpan(
            text: ' Sign Up',
            style: const TextStyle(
                color: Color(0xff3461FD), fontWeight: FontWeight.w500),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPage()),
                );
              })
      ]),
    );
  }
}
