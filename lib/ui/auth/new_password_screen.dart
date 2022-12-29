import 'package:beehive_kitchen/extension/context_extension.dart';
import 'package:beehive_kitchen/ui/auth/login_screen.dart';
import 'package:beehive_kitchen/ui/auth/new_password_screen_bloc.dart';
import 'package:beehive_kitchen/ui/common/app_button.dart';
import 'package:beehive_kitchen/ui/common/app_text_field.dart';
import 'package:beehive_kitchen/utils/app_strings.dart';
import 'package:beehive_kitchen/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../common/app_bar.dart';
import 'new_password_screen_bloc_state.dart';

class NewPasswordScreen extends StatelessWidget {
  static const String route = 'new_password_screen_route';

  final mobileController = TextEditingController();

  NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    final bloc=context.read<NewPasswordScreenBloc>();
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              const AppBarItem(title: AppText.CREATE_NEW_PASSWORD),
              const Text(AppText.YOUR_NEW_PASSWORD_MUST_BE_DIFFIRENT,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Constants.colorTextLight4,
                      fontSize: 14,
                      fontFamily: Constants.cairoSemibold)),
              const SizedBox(height: 25),
              const Text(AppText.NEW_PASSWORD,
                  style: TextStyle(
                      color: Constants.colorOnSecondary,
                      fontSize: 16,
                      fontFamily: Constants.cairoSemibold)),

              BlocBuilder<NewPasswordScreenBloc,NewPasswordScreenBlocState>(
                builder: (_,state)=>AppTextField(
                    hint: AppText.ENTER,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () =>
                            bloc.togglePasswordObscure(),
                        child: Icon( state.isNewPassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                            size: 22,
                            color: Constants.colorTextLight),
                      ),
                    ),
                    isObscure: state.isNewPassword,
                    textInputType: TextInputType.visiblePassword,
                    isError: false),
              ),

              const Text(AppText.CONFIRM_NEW_PASSWORD,
                  style: TextStyle(
                      color: Constants.colorOnSecondary,
                      fontSize: 16,
                      fontFamily: Constants.cairoSemibold)),

              BlocBuilder<NewPasswordScreenBloc,NewPasswordScreenBlocState>(
                builder: (_,state)=>AppTextField(
                    hint: AppText.ENTER,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () =>
                            bloc.toggleConfirmPasswordObscure(),
                        child: Icon( state.isConfirmNewPassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                            size: 22,
                            color: Constants.colorTextLight),
                      ),
                    ),
                    isObscure: state.isConfirmNewPassword,
                    textInputType: TextInputType.visiblePassword,
                    isError: false),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                    height: 60,
                    width: size.width,
                    child: AppButton(
                        onClick: () {
                          FocusScope.of(context).unfocus();
                          Navigator.pushNamedAndRemoveUntil(context, LoginScreen.route, (route) => false);
                        },
                        text: AppText.RESET,
                        textColor: Constants.colorOnSurface,
                        borderRadius: 15.0,
                        fontSize: 16,
                        color: Constants.colorPrimary)),
              ),
            ],
        ),
      ),
    ),
        ));
  }
}
