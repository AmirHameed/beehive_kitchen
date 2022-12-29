import 'package:beehive_kitchen/extension/context_extension.dart';
import 'package:beehive_kitchen/ui/auth/signup_profile_screen_bloc.dart';
import 'package:beehive_kitchen/ui/common/app_bar.dart';
import 'package:beehive_kitchen/ui/common/app_button.dart';
import 'package:beehive_kitchen/ui/common/app_text_field.dart';
import 'package:beehive_kitchen/ui/main/main_screen.dart';
import 'package:beehive_kitchen/ui/we_will_contact_screen.dart';
import 'package:beehive_kitchen/utils/app_strings.dart';
import 'package:beehive_kitchen/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'otp_screen.dart';

class SignUpProfileScreen extends StatelessWidget {
  static const String route = 'signup_profile_screen_route';

  const SignUpProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    final bloc = context.read<SignUpProfileScreenBloc>();

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const AppBarItem(title: AppText.CREATE_ACCOUNT),
              Align(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Image.asset('assets/profile_image.png',
                        width: 90, height: 90),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                            onTap: () {
                              ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                            },
                            child: Image.asset('assets/add_photo.png',
                                width: 30, height: 30)))
                  ],
                ),
              ),
              const Text(AppText.STORE_NAME,
                  style: TextStyle(
                      fontSize: 16,
                      color: Constants.colorOnSecondary,
                      fontFamily: Constants.cairoSemibold)),
              const AppTextField(
                  hint: AppText.STORE_NAME,
                  textInputType: TextInputType.text,
                  isError: false),
              const SizedBox(height: 10),
              const Text(AppText.CATEGORY,
                  style: TextStyle(
                      fontSize: 16,
                      color: Constants.colorOnSecondary,
                      fontFamily: Constants.cairoSemibold)),
              PopupMenuButton(
                  elevation: 20,
                  constraints: BoxConstraints(maxWidth: size.width - 40),
                  enabled: true,
                  position: PopupMenuPosition.over,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  offset: const Offset(0, 30),
                  tooltip: '',
                  splashRadius: 0,
                  onSelected: (value) {
                    context.unfocus();
                    bloc.vehicleTextController.text = value.toString();
                  },
                  itemBuilder: (context) {
                    context.unfocus();
                    return ['Beef', 'Burgur', 'Pizza']
                        .map((String choice) => PopupMenuItem(
                            textStyle:
                                const TextStyle(color: Constants.colorSurface),
                            value: choice,
                            child: SizedBox(
                                width: size.width, child: Text(choice))))
                        .toList();
                  },
                  child: Container(
                      height: 60,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 15),
                      margin: const EdgeInsets.only(bottom: 10, top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Constants.colorTextLight3),
                      ),
                      child: TextFormField(
                          enabled: false,
                          readOnly: true,
                          textInputAction: TextInputAction.next,
                          onTap: () => context.unfocus(),
                          controller: bloc.vehicleTextController,
                          style: const TextStyle(
                              color: Constants.colorOnSecondary,
                              fontFamily: Constants.cairoRegular,
                              fontSize: 14),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: AppText.CHOOSE,
                              suffixIcon: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Icon(Icons.keyboard_arrow_down_rounded,
                                    size: 22, color: Constants.colorTextLight),
                              ),
                              focusedBorder: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: Constants.colorSecondary,
                                  fontFamily: Constants.cairoRegular,
                                  fontSize: 13))))),
              const Text(AppText.EMAIL,
                  style: TextStyle(
                      fontSize: 16,
                      color: Constants.colorOnSecondary,
                      fontFamily: Constants.cairoSemibold)),
              const AppTextField(
                  hint: AppText.ENTER_EMAIL,
                  textInputType: TextInputType.text,
                  isError: false),
              const SizedBox(height: 10),
              const Text(AppText.MOBILE_NUMBER,
                  style: TextStyle(
                      fontSize: 16,
                      color: Constants.colorOnSecondary,
                      fontFamily: Constants.cairoSemibold)),
              const AppTextField(
                  hint: AppText.ENTER_MOBILE,
                  textInputType: TextInputType.text,
                  isError: false),
              const SizedBox(height: 10),
              const Text(AppText.PASSWORD,
                  style: TextStyle(
                      fontSize: 16,
                      color: Constants.colorOnSecondary,
                      fontFamily: Constants.cairoSemibold)),
              BlocBuilder<SignUpProfileScreenBloc, bool>(
                builder: (_, isPasswordObscure) => AppTextField(
                    hint: AppText.ENTER,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () => bloc.togglePasswordObscure(),
                        child: Icon(
                            isPasswordObscure
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
              const SizedBox(height: 10),
              const Text(AppText.STORE_LOCATION,
                  style: TextStyle(
                      fontSize: 16,
                      color: Constants.colorOnSecondary,
                      fontFamily: Constants.cairoSemibold)),
              AppTextField(
                  hint: AppText.ENTER_LOCATION,
                  readOnly: true,
                  suffixIcon: GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Constants.colorLightPink,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Text(AppText.CHOOSE_FROM_MAP,
                          style: TextStyle(
                              fontSize: 14,
                              color: Constants.colorPrimary,
                              fontFamily: Constants.cairoRegular)),
                    ),
                  ),
                  textInputType: TextInputType.text,
                  isError: false),
              const SizedBox(height: 10),
              const Text(AppText.MAROF_CODE,
                  style: TextStyle(
                      fontSize: 16,
                      color: Constants.colorOnSecondary,
                      fontFamily: Constants.cairoSemibold)),
              const AppTextField(
                  hint: AppText.ENTER_MAROOF_CODE,
                  textInputType: TextInputType.text,
                  isError: false),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: SizedBox(
                    height: 60,
                    width: size.width,
                    child: AppButton(
                        onClick: () {
                          FocusScope.of(context).unfocus();
                          Navigator.pushNamed(context, OTPScreen.route,arguments: true);
                        },
                        text: AppText.CREATE_ACCOUNT,
                        textColor: Constants.colorOnSurface,
                        borderRadius: 8.0,
                        fontSize: 16,
                        color: Constants.colorPrimary)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(AppText.HAVE_AN_ACCOUNT,
                      style: TextStyle(
                          color: Constants.colorOnSecondary,
                          fontSize: 14,
                          fontFamily: Constants.cairoRegular)),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text(AppText.LOGIN,
                        style: TextStyle(
                            color: Constants.colorPrimary,
                            fontSize: 14,
                            fontFamily: Constants.cairoRegular)),
                  ),
                ],
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    ));
  }
}
