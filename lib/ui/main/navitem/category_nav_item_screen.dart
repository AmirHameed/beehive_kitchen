import 'package:beehive_kitchen/extension/context_extension.dart';
import 'package:beehive_kitchen/ui/main/main_screen_bloc.dart';
import 'package:beehive_kitchen/ui/main/main_screen_state.dart';
import 'package:beehive_kitchen/ui/main/navitem/order_screen.dart';
import 'package:beehive_kitchen/ui/order-detail/order_detail_screen.dart';
import 'package:beehive_kitchen/ui/resturant_detail_screen.dart';
import 'package:beehive_kitchen/utils/app_strings.dart';
import 'package:beehive_kitchen/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/app_button.dart';

class CategoryNavigationItemScreen extends StatelessWidget {
  static const String key_title = 'category_navigation_screen_key_title';

  const CategoryNavigationItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    final bloc = context.read<MainScreenBloc>();

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            const Text(AppText.CATEGORIES,
                style: TextStyle(
                    color: Constants.colorOnSecondary,
                    fontSize: 16,
                    fontFamily: Constants.cairoBold)),
            GestureDetector(
              onTap: () {
                showPriceOfferBottomSheet(context);
              },
              child: const Text(AppText.ADD_NEW,
                  style: TextStyle(
                      color: Constants.colorOnIcon,
                      fontSize: 12,
                      fontFamily: Constants.cairoSemibold)),
            ),
          ],
        ),
      ),
      const Divider(
        thickness: 1,
        color: Constants.colorTextLight2,
        height: 1,
      ),
      const SizedBox(height: 10),
      ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (_,index)=> GestureDetector(
          onTap: ()=>Navigator.pushNamed(context, RestaurantDetailScreen.route),
          child: Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1, color: Constants.colorTextLight3)),
            child: Row(
              children: [
                 Text(index==0?'Beef burgur':index==1?'Pizza':index==2?'Chicken':'Steak',
                    style: const TextStyle(
                        color: Constants.colorOnSecondary,
                        fontFamily: Constants.cairoBold,
                        fontSize: 14)),
                const SizedBox(width: 10),
                const Spacer(),
                Container(
                    height: 25,
                    width: 25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constants.colorPrimary,
                        border: Border.all(width: 1, color: Constants.colorOnPrimary)),
                    child:  Text(index==0?'5':index==1?'3':index==2?'3':'2',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Constants.colorOnPrimary,
                            fontFamily: Constants.cairoRegular))),
                const Icon(Icons.arrow_forward_ios_rounded,
                    color: Constants.colorTextLight, size: 18)
              ],
            ),
          ),
        ),
      )
    ]);
  }
}

showPriceOfferBottomSheet(BuildContext context) {
  final _formkey = GlobalKey<FormState>();
  final size = context.screenSize;

  return showModalBottomSheet(
    context: context,
    enableDrag: true,
    isDismissible: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
    ),
    builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Constants.colorTextLight2,
            ),
            width: 40,
            height: 6,
          ),
          const Text(AppText.ADD_CATEGORY,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: Constants.cairoBold,
                  color: Constants.colorOnSecondary)),
          Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(AppText.CATEGORY_NAME,
                      style: TextStyle(
                          fontSize: 16, color: Constants.colorOnSecondary, fontFamily: Constants.cairoSemibold)),
                  Container(
                      height: 48,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.only(
                          bottom: 20, top: 10, left: 0, right: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Constants.colorTextLight)),
                      child: TextFormField(
                          controller: TextEditingController(),
                          onChanged: (String? value) {},
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                              color: Constants.colorOnSecondary, fontSize: 14),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: AppText.ENTER_CATEGORY_NAME ,
                              hintStyle: TextStyle(
                                  color: Constants.colorTextLight,
                                  fontFamily: Constants.cairoRegular,
                                  fontSize: 13)))),
                  SizedBox(
                      height: 48,
                      width: size.width,
                      child: AppButton(
                          onClick: () {
                            FocusScope.of(context).unfocus();
                          },
                          text: AppText.SAVE,
                          textColor: Constants.colorOnSurface,
                          borderRadius: 8.0,
                          fontSize: 16,
                          color: Constants.colorPrimary)),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}
