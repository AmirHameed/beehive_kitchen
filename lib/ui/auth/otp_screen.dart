import 'dart:async';

import 'package:beehive_kitchen/extension/context_extension.dart';
import 'package:beehive_kitchen/ui/auth/new_password_screen.dart';
import 'package:beehive_kitchen/ui/common/app_button.dart';
import 'package:beehive_kitchen/ui/we_will_contact_screen.dart';
import 'package:beehive_kitchen/utils/app_strings.dart';
import 'package:beehive_kitchen/utils/constants.dart';
import 'package:flutter/material.dart';

import '../common/app_bar.dart';

class OTPScreen extends StatefulWidget {
  static const String route = 'otp_screen_route';
  final bool isLogin;

    OTPScreen({required this.isLogin});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final mobileController = TextEditingController();
  int timerMaxSeconds = 59;
  int currentSeconds = 0;
  Duration internal = const Duration(seconds: 1);

  startTimeout() {
    var duration = internal;
    Timer.periodic(duration, (timer) {
      setState(() {
        if (timer.tick == 59) {
          timer.cancel();
        }
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }

  String get text =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';


  @override
  void initState() {
    startTimeout();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
      child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20,right: 40),
              child: AppBarItem(title: AppText.VERIFICATION),
            ),
            const Image(image:AssetImage('assets/verification_image.png'),width: 90,height: 90),
            const SizedBox(height: 10),
            const Text(AppText.PLEASE_ENTER_THE_OTP_CODE,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Constants.colorOnSecondary,
                    fontSize: 12,
                    fontFamily: Constants.cairoRegular)),
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(AppText.OTP,
                    style: TextStyle(
                        fontSize: 16,
                        color: Constants.colorOnSecondary,
                        fontFamily: Constants.cairoSemibold)),
              ),
            ),
            Container(
                height: 60,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                margin: const EdgeInsets.only(
                    bottom: 10, top: 5, left: 20, right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Constants.colorTextLight)),
                child: TextFormField(
                    controller: mobileController,
                    onChanged: (String? value) {},
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(
                        color: Constants.colorOnSecondary, fontSize: 14),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: AppText.ENTER,
                        hintStyle: TextStyle(
                            color: Constants.colorTextLight,
                            fontSize: 13,
                            fontFamily: Constants.cairoRegular)))),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: SizedBox(
                  height: 60,
                  width: size.width,
                  child: AppButton(
                      onClick: () {
                        FocusScope.of(context).unfocus();
                        Navigator.pushNamed(context,widget.isLogin? WeWillContactYouScreen.route:NewPasswordScreen.route);
                      },
                      text: AppText.VERIFY,
                      textColor: Constants.colorOnSurface,
                      borderRadius: 15.0,
                      fontSize: 16,
                      color: Constants.colorPrimary)),
            ),
            Text(text,
                style: const TextStyle(
                    color: Constants.colorOnSecondary,
                    fontSize: 16,
                    fontFamily: Constants.cairoSemibold)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(AppText.NOT_RECEIVED,
                    style: TextStyle(
                        color: Constants.colorOnSecondary,
                        fontSize: 14,
                        fontFamily: Constants.cairoMedium)),
                SizedBox(width: 5),
                Text(AppText.RESEND,
                    style: TextStyle(
                        color: Constants.colorPrimary,
                        fontSize: 14,
                        fontFamily: Constants.cairoBold)),
              ],
            ),
          ],
      ),
    ),
        ));
  }
}
