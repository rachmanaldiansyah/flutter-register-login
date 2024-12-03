import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_register_login/common/bloc/auth/auth_state.dart';
import 'package:flutter_register_login/domain/usecases/islogged_in_usecase.dart';
import 'package:flutter_register_login/service_locator.dart';

class AuthStateCubit extends Cubit<AuthState> {
  AuthStateCubit() : super(AppInitialState());

  void appStarted() async {
    var isLoggedIn = await svcLocator<IsLoggedInUseCase>().call();

    isLoggedIn ? emit(Authenticated()) : emit(UnAuthenticated());
  }
}
