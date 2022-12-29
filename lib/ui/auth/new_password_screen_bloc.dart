import 'package:beehive_kitchen/ui/auth/new_password_screen_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPasswordScreenBloc extends Cubit<NewPasswordScreenBlocState>{
  NewPasswordScreenBloc():super(const NewPasswordScreenBlocState.initi());

  void togglePasswordObscure() =>
      emit(state.copyWith(isNewPassword: !state.isNewPassword));

  void toggleConfirmPasswordObscure() =>
      emit(state.copyWith(isConfirmNewPassword: !state.isConfirmNewPassword));
}