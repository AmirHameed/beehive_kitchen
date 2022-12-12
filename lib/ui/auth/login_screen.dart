import 'package:beehive_kitchen/extension/context_extension.dart';
import 'package:beehive_kitchen/ui/auth/signup_profile_screen.dart';
import 'package:beehive_kitchen/ui/common/app_bar.dart';
import 'package:beehive_kitchen/ui/common/app_button.dart';
import 'package:beehive_kitchen/ui/common/app_text_field.dart';
import 'package:beehive_kitchen/utils/app_strings.dart';
import 'package:beehive_kitchen/utils/constants.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatelessWidget {
  static const String route = 'login_screen_route';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;

    return Scaffold(
        bottomNavigationBar:  Padding(
          padding: const EdgeInsets.only(bottom: 10),
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
            const AppBarItem(title: AppText.LOGIN),
            const Text(AppText.EMAIL,
                style: TextStyle(
                    fontSize: 16,
                    color: Constants.colorOnSecondary,
                    fontFamily: Constants.cairoSemibold)),
            const AppTextField(
                hint: AppText.ENTER,
                textInputType: TextInputType.text,
                isError: false),
            const Text(AppText.PASSWORD,
                style: TextStyle(
                    fontSize: 16,
                    color: Constants.colorOnSecondary,
                    fontFamily: Constants.cairoSemibold)),
            const AppTextField(
              hint: AppText.ENTER,
              textInputType: TextInputType.text,
              isError: false,
              isObscure: true,
            ),
            const Align(
              alignment: Alignment.topRight,
              child: Text(AppText.FORGOT_PASSWORD,
                  style: TextStyle(
                      color: Constants.colorPrimary,
                      fontSize: 14,
                      fontFamily: Constants.cairoRegular)),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.12),
              child: SizedBox(
                  height: 60,
                  width: size.width,
                  child: AppButton(
                      onClick: () {
                        FocusScope.of(context).unfocus();
                        Navigator.pushNamed(context, SignUpProfileScreen.route);
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
