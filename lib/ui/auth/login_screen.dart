
import 'package:beehive_kitchen/extension/context_extension.dart';
import 'package:beehive_kitchen/ui/auth/signup_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/app_strings.dart';
import '../../utils/constants.dart';
import '../common/app_button.dart';
import '../common/app_text_field.dart';
import '../main/main_screen.dart';
import 'forgot_password_screen.dart';
import 'login_screen_bloc.dart';
class LoginScreen extends StatelessWidget {
  static const String route = 'login_screen_route';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    final bloc=context.read<LoginScreenBloc>();

    return Scaffold(
        bottomNavigationBar:  Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(AppText.DONT_HAVE_AN_ACCOUNT,
                  style: TextStyle(
                      color: Constants.colorOnSecondary,
                      fontSize: 14,
                      fontFamily: Constants.cairoRegular)),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, SignUpProfileScreen.route),
                child: const Text(AppText.CREATE_ACCOUNT,
                    style: TextStyle(
                        color: Constants.colorPrimary,
                        fontSize: 14,
                        fontFamily: Constants.cairoRegular)),
              ),
            ],
          ),
        ),
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Center(
              child: Text(AppText.LOGIN,
                  style: TextStyle(
                      color: Constants.colorOnSecondary,
                      fontSize: 16,
                      fontFamily: Constants.cairoBold)),
            ),
            const SizedBox(height: 30),
            const Text(AppText.PHONE,
                style: TextStyle(
                    fontSize: 16,
                    color: Constants.colorOnSecondary,
                    fontFamily: Constants.cairoSemibold)),
            const AppTextField(
              hint: AppText.PHONE_NUMBER,
              textInputType: TextInputType.text,
              prefixIcon: Text('+966  ',style: TextStyle(color: Constants.colorTextLight, fontFamily: Constants.cairoRegular, fontSize: 14)),
              isError: false,
              isObscure: false,
            ),
            const Text(AppText.PASSWORD,
                style: TextStyle(
                    fontSize: 16,
                    color: Constants.colorOnSecondary,
                    fontFamily: Constants.cairoSemibold)),
            BlocBuilder<LoginScreenBloc,bool>(
              builder: (_,isPasswordObscure)=>AppTextField(
                  hint: AppText.ENTER,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () =>
                          bloc.togglePasswordObscure(),
                      child: Icon( isPasswordObscure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                          size: 22,
                          color: Constants.colorTextLight),
                    ),
                  ),
                  isObscure: isPasswordObscure,
                  textInputType: TextInputType.visiblePassword,
                  isError: false),
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: ()=>Navigator.pushNamed(context, ForgotPasswordScreen.route),
                child: const Text(AppText.FORGOT_PASSWORD,
                    style: TextStyle(
                        color: Constants.colorPrimary,
                        fontSize: 14,
                        fontFamily: Constants.cairoRegular)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.12),
              child: SizedBox(
                  height: 60,
                  width: size.width,
                  child: AppButton(
                      onClick: () {
                        FocusScope.of(context).unfocus();
                        Navigator.pushNamed(context, MainScreen.route);
                      },
                      text: AppText.LOGIN,
                      textColor: Constants.colorOnSurface,
                      borderRadius: 6.0,
                      fontSize: 18,
                      color: Constants.colorPrimary)),
            ),
          ],
        ),
      ),
    ));
  }
}
