import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_register_login/common/bloc/auth/auth_state.dart';
import 'package:flutter_register_login/common/bloc/auth/auth_state_cubit.dart';

import 'package:flutter_register_login/cores/configs/app_theme.dart';
import 'package:flutter_register_login/presentation/auth/pages/signup_page.dart';
import 'package:flutter_register_login/presentation/home/pages/home_page.dart';
import 'package:flutter_register_login/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: Colors.black,
  ));
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom],
    );
    return BlocProvider(
      create: (context) => AuthStateCubit()..appStarted(),
      child: MaterialApp(
        theme: AppTheme.appTheme,
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthStateCubit, AuthState>(
          builder: (context, state) {
            if (state is Authenticated) {
              return const HomePage();
            }
            if (state is UnAuthenticated) {
              return SignupPage();
            }
            return Container();
          },
        ),
      ),
    );
  }
}
