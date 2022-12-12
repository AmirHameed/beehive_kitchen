import 'package:beehive_kitchen/extension/context_extension.dart';
import 'package:beehive_kitchen/ui/auth/signup_profile_screen_bloc.dart';
import 'package:beehive_kitchen/ui/common/app_bar.dart';
import 'package:beehive_kitchen/ui/common/app_button.dart';
import 'package:beehive_kitchen/ui/common/app_text_field.dart';
import 'package:beehive_kitchen/ui/we_will_contact_screen.dart';
import 'package:beehive_kitchen/utils/app_strings.dart';
import 'package:beehive_kitchen/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

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
          const AppBarItem(title: AppText.CREATE_ACCOUNT),
          Align(
            alignment: Alignment.center,
            child: Stack(
                children: [
                  Image.asset('assets/profile_image.png', width: 90, height: 90),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                          onTap: () {
                            ImagePicker().pickImage(source: ImageSource.gallery);
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
        const AppTextField(
            hint: AppText.CHOOSE,
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Icon(Icons.keyboard_arrow_down_rounded,size: 22,color: Constants.colorTextLight),
            ),
            textInputType: TextInputType.text,
            isError: false),

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
           AppTextField(
                hint: AppText.ENTER,
                isObscure: true,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Icon(Icons.remove_red_eye,color: Constants.colorSecondary.withOpacity(0.5),size: 18),
                ),
                textInputType: TextInputType.text,
                isError: false),
          const SizedBox(height: 10),

          const Text(AppText.STORE_LOCATION,
              style: TextStyle(
                  fontSize: 16,
                  color: Constants.colorOnSecondary,
                  fontFamily: Constants.cairoSemibold)),
          AppTextField(
              hint: AppText.ENTER_LOCATION,
              suffixIcon: GestureDetector(
                onTap: ()=>ImagePicker().pickImage(source: ImageSource.gallery),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Constants.colorLightPink,
                      borderRadius: BorderRadius.circular(15)
                  ),

                  child: const Text(AppText.CHOOSE_FROM_MAP,style: TextStyle(fontSize: 14,color: Constants.colorPrimary,fontFamily: Constants.cairoRegular)),
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
                padding: const EdgeInsets.only(top: 10,bottom: 20),
                child: SizedBox(
                    height: 60,
                    width: size.width,
                    child: AppButton(
                        onClick: () {
                          FocusScope.of(context).unfocus();
                          Navigator.pushNamed(context, WeWillContactYouScreen.route);
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

          const SizedBox(height: 15)
      ],
    ),
            ),
          ),
        ));
  }
}
