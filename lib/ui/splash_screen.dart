import 'package:beehive_kitchen/extension/context_extension.dart';
import 'package:beehive_kitchen/ui/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatelessWidget {
  static const String route = '/';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    Future.delayed(const Duration(seconds: 7))
        .then((value) => Navigator.pushNamedAndRemoveUntil(context, LoginScreen.route,(_)=>false));

    final size = context.screenSize;

    return Scaffold(
        body: SizedBox(
            width: size.width,
            height: size.height,
            child: Image.asset(
              'assets/BeeHive Splash.gif',
              width: size.width,
              height: size.height,
              fit: BoxFit.fill,
            )));
  }
}
