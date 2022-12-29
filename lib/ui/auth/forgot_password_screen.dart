import 'package:beehive_kitchen/extension/context_extension.dart';
import 'package:beehive_kitchen/ui/auth/otp_screen.dart';
import 'package:beehive_kitchen/ui/common/app_button.dart';
import 'package:beehive_kitchen/ui/common/app_text_field.dart';
import 'package:beehive_kitchen/utils/app_strings.dart';
import 'package:beehive_kitchen/utils/constants.dart';
import 'package:flutter/material.dart';
import '../common/app_bar.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String route = 'forgot_password_screen_route';

  final mobileController = TextEditingController();

  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBarItem(title: AppText.FORGOT_PASSWORD_),
              const Text(AppText.PLEASE_ENTER_THE_FORGOT_PASSWORD_CODE,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Constants.colorTextLight4,
                      fontSize: 14,
                      fontFamily: Constants.cairoSemibold)),
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
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                    height: 60,
                    width: size.width,
                    child: AppButton(
                        onClick: () {
                          FocusScope.of(context).unfocus();
                          Navigator.pushNamed(context, OTPScreen.route,arguments: false);
                        },
                        text: AppText.SEND,
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
