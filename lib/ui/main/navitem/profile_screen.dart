import 'package:beehive_kitchen/ui/my_information_screen.dart';
import 'package:beehive_kitchen/ui/reviews_screen.dart';
import 'package:beehive_kitchen/ui/setting/setting_screen.dart';
import 'package:beehive_kitchen/utils/app_strings.dart';
import 'package:beehive_kitchen/utils/constants.dart';
import 'package:flutter/material.dart';

class ProfileNavigationItemScreen extends StatelessWidget {
  static const String key_title = 'profile_nav_screen_key_title';

  const ProfileNavigationItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const SizedBox(height: 10),
      const Text(AppText.PROFILE,
          style: TextStyle(
              color: Constants.colorOnSecondary,
              fontSize: 16,
              fontFamily: Constants.cairoBold)),
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Divider(
          thickness: 1,
          color: Constants.colorTextLight2,
          height: 1,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
            child: Stack(
          children: [
            Image.asset('assets/home_location_header.png'),
            Positioned(
              left: 10,
              top: 15,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text('Your Balance',
                          style: TextStyle(
                              color: Constants.colorOnPrimary,
                              fontSize: 12,
                              fontFamily: Constants.cairoRegular)),
                      Text('234.34\$',
                          style: TextStyle(
                              color: Constants.colorOnPrimary,
                              fontSize: 15,
                              fontFamily: Constants.cairoBold))
                    ],
                  ),
                  const Text('Withdraw',
                      style: TextStyle(
                          color: Constants.colorOnPrimary,
                          fontSize: 12,
                          fontFamily: Constants.cairoRegular)),
                ],
              ),
            ),
          ],
        )),
      ),
      const SizedBox(height: 10),
      _SingleProfileItemNavigation(
          title: AppText.STORE_INFORMATION,
          image: 'assets/user-square.png',
          onTap: () => Navigator.pushNamed(context, MyInformationScreen.route)),
      _SingleProfileItemNavigation(
          title: AppText.SETTINGS,
          image: 'assets/setting-2@2x.png',
          onTap: () {
            Navigator.pushNamed(context, SettingScreen.route);
          }),
      _SingleProfileItemNavigation(
          title: AppText.CONTACT_US,
          image: 'assets/call_tracking.png',
          onTap: () {}),
      _SingleProfileItemNavigation(
          title: AppText.MY_REVIEWS,
          image: 'assets/full.png',
          onTap: () => Navigator.pushNamed(context, ReviewsScreen.route)),
    ]);
  }
}

class _SingleProfileItemNavigation extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  const _SingleProfileItemNavigation(
      {required this.title, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        onTap: onTap,
        title: Text(title,
            style: const TextStyle(
                color: Constants.colorOnSecondary,
                fontSize: 16,
                fontFamily: Constants.cairoRegular)),
        leading: Image.asset(image, height: 25, width: 25, color: Colors.black),
        trailing: const Icon(Icons.arrow_forward_ios_rounded,
            size: 20, color: Constants.colorTextLight),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Constants.colorTextLight2, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
