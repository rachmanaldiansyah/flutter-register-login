import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_register_login/domain/usecases/get_user_usecase.dart';
import 'package:flutter_register_login/presentation/home/bloc/user_display_state.dart';
import 'package:flutter_register_login/service_locator.dart';

class UserDisplayCubit extends Cubit<UserDisplayState> {
  UserDisplayCubit() : super(UserLoading());

  void displayUser() async {
    var result = await svcLocator<GetUserUseCase>().call();
    result.fold((error) {
      emit(LoadUserFailure(errorMessage: error));
    }, (data) {
      emit(UserLoaded(userEntity: data));
    });
  }
}
