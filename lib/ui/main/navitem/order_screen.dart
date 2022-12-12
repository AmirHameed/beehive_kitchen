import 'package:beehive_kitchen/extension/context_extension.dart';
import 'package:beehive_kitchen/helper/dialog_helper.dart';
import 'package:beehive_kitchen/ui/chat_screen.dart';
import 'package:beehive_kitchen/ui/common/app_button.dart';
import 'package:beehive_kitchen/ui/main/main_screen_bloc.dart';
import 'package:beehive_kitchen/ui/main/main_screen_state.dart';
import 'package:beehive_kitchen/ui/order-detail/order_detail_screen.dart';
import 'package:beehive_kitchen/ui/order_tracking_screen.dart';
import 'package:beehive_kitchen/utils/app_strings.dart';
import 'package:beehive_kitchen/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/app_bar.dart';

class OrderNavigationItemScreen extends StatelessWidget {
  static const String key_title = 'order_navigation_item_screen_key_title';

  const OrderNavigationItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;

    final bloc = context.read<MainScreenBloc>();
    final dialogHelper = DialogHelper.instance();
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: AppBarItem(title: AppText.ORDERS),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Divider(
            thickness: 1,
            color: Constants.colorTextLight2,
            height: 1,
          ),
        ),
        BlocBuilder<MainScreenBloc, MainScreenState>(
          buildWhen: (previous, current) => previous != current,
          builder: (_, state) => Container(
            height: 60,
            width: size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Constants.colorLightPink),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => bloc.updateOrderIndex(0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: state.orderIndex == 0
                              ? Constants.colorPrimary
                              : Colors.transparent),
                      child: Text('${AppText.NEW} (12)',
                          style: TextStyle(
                              color: state.orderIndex == 0
                                  ? Colors.white
                                  : Constants.colorPrimary,
                              fontFamily: Constants.cairoRegular,
                              fontSize: 14)),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: state.orderIndex == 1
                              ? Constants.colorPrimary
                              : Colors.transparent),
                      child: Text('${AppText.COMPLETED} (134)',
                          style: TextStyle(
                              color: state.orderIndex == 1
                                  ? Colors.white
                                  : Constants.colorPrimary,
                              fontFamily: Constants.cairoRegular,
                              fontSize: 14)),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: state.orderIndex == 2
                              ? Constants.colorPrimary
                              : Colors.transparent),
                      child: Text(
                        '${AppText.CANCELLED} (23)',
                        style: TextStyle(
                            color: state.orderIndex == 2
                                ? Colors.white
                                : Constants.colorPrimary,
                            fontFamily: Constants.cairoRegular,
                            fontSize: 14),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        BlocBuilder<MainScreenBloc, MainScreenState>(
          buildWhen: (previous, current) => previous != current,
          builder: (_, state) => Expanded(
              child: state.orderIndex == 0
                  ? Column(
                      children: [
                        GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, OrderDetailScreen.route,
                                arguments: [false, false, true]),
                            child: const SingleOrderItemWidget(title: AppText.NEW)),
                        GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, OrderDetailScreen.route,
                                arguments: [false, false, true]),
                            child: const SingleOrderItemWidget(
                                title: AppText.NEW)),
                      ],
                    )
                  : state.orderIndex == 1
                      ? Column(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, OrderDetailScreen.route,
                                  arguments: [false, false, true]),
                              child: const SingleOrderItemWidget(
                                  title: AppText.COMPLETED),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, OrderDetailScreen.route,
                                  arguments: [false, false, true]),
                              child: const SingleOrderItemWidget(
                                  title: AppText.COMPLETED),
                            ),
                          ],
                        )
                      : Column(
                          children:  [
                            GestureDetector(
                                onTap: ()=>Navigator.pushNamed(
                                    context, OrderDetailScreen.route,
                                    arguments: [false, false, true]),child: const SingleOrderItemWidget(title: AppText.CANCELLED)),
                            GestureDetector(
                                onTap: ()=>Navigator.pushNamed(
                                    context, OrderDetailScreen.route,
                                    arguments: [false, false, true]),child: const SingleOrderItemWidget(title: AppText.CANCELLED)),
                          ],
                        )),
        )
      ],
    );
  }
}

class SingleOrderItemWidget extends StatelessWidget {
  final String title;

  const SingleOrderItemWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    final dialogHelper = DialogHelper.instance();
    final size = context.screenSize;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: Constants.colorTextLight3)),
      child: Column(
        children: [
          OrderBoxHeader(title: title),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Date',
                    style: TextStyle(
                        fontSize: 14,
                        color: Constants.colorTextLight,
                        fontFamily: Constants.cairoRegular)),
                Text('20/10/2022',
                    style: TextStyle(
                        fontSize: 14,
                        color: Constants.colorOnSecondary,
                        fontFamily: Constants.cairoSemibold))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text('Amount',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 14,
                        color: Constants.colorTextLight,
                        fontFamily: Constants.cairoRegular)),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('1.90',
                        style: TextStyle(
                            color: Constants.colorOnSecondary,
                            fontSize: 14,
                            fontFamily: Constants.cairoSemibold)),
                    Image.asset('assets/dollar.png', height: 10, width: 10),
                  ],
                ),
              ],
            ),
          ),
          title == AppText.NEW
              ? GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 10),
              alignment: Alignment.center,
              height: 48,
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      width: 1, color: Constants.colorPrimary),
                  color: Constants.colorPrimary),
              child: const Text(AppText.START_ORDER,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontFamily: Constants.cairoRegular)),
            ),
          )
              : title == AppText.COMPLETED
                  ? OrderButtonWidget(
                      lastButton: () => Navigator.pushNamed(
                          context, OrderDetailScreen.route,
                          arguments: [true, false, false]),
                      lastText: AppText.RE_ORDER,
                      firstButton: () => dialogHelper
                        ..injectContext(context)
                        ..showWriteReviewDialog((text) {}),
                      firstText: AppText.REVIEW):
          title == AppText.NEW_APPROVED
              ? GestureDetector(
            onTap: () => Navigator.pushNamed(
                context, ChatScreen.route,
                arguments: [true, false, false]),
            child: Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 10),
              alignment: Alignment.center,
              height: 48,
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      width: 1, color: Constants.colorPrimary),
                  color: Constants.colorPrimary),
              child: const Text(AppText.CHAT,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontFamily: Constants.cairoRegular)),
            ),
          )
                  : GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, OrderDetailScreen.route,
                          arguments: [true, false, false]),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        alignment: Alignment.center,
                        height: 48,
                        width: size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                width: 1, color: Constants.colorPrimary),
                            color: Constants.colorPrimary),
                        child: const Text(AppText.RE_ORDER,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: Constants.cairoRegular)),
                      ),
                    )
        ],
      ),
    );
  }
}

class OrderBoxHeader extends StatelessWidget {
  final String title;

  const OrderBoxHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Order ID #1234',
                  style: TextStyle(
                      fontSize: 14,
                      color: Constants.colorOnSecondary,
                      fontFamily: Constants.cairoBold)),
              Row(
                children: [
                  Text(title,
                      style: TextStyle(
                          fontSize: 14,
                          color: title == AppText.NEW || title==AppText.NEW_APPROVED
                              ? Constants.colorIcon
                              : title == AppText.COMPLETED
                                  ? Constants.colorGreen
                                  : Constants.colorError,
                          fontFamily: Constants.cairoRegular)),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Constants.colorTextLight,
                  )
                ],
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 1,
          height: 1,
          color: Constants.colorTextLight3,
        ),
      ],
    );
  }
}

class OrderButtonWidget extends StatelessWidget {
  final String firstText;
  final String lastText;
  final VoidCallback firstButton;
  final VoidCallback lastButton;

  const OrderButtonWidget(
      {required this.firstText,
      required this.lastText,
      required this.firstButton,
      required this.lastButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: firstButton,
              child: Container(
                alignment: Alignment.center,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(width: 1, color: Constants.colorPrimary)),
                child: Text(firstText,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Constants.colorPrimary,
                        fontFamily: Constants.cairoRegular)),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: lastButton,
              child: Container(
                alignment: Alignment.center,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: Constants.colorPrimary),
                    color: Constants.colorPrimary),
                child: Text(lastText,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontFamily: Constants.cairoRegular)),
              ),
            ),
          )
        ],
      ),
    );
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
          const Text(AppText.PRICE_OFFER,
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
                  const Text(AppText.DELIVERY_TIME,
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
                              hintText: 'Enter',
                              hintStyle: TextStyle(
                                  color: Constants.colorTextLight,
                                  fontFamily: Constants.cairoRegular,
                                  fontSize: 13)))),
                  const Text(AppText.DELIVERY_COST,
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
                              hintText: 'Enter',
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
                          text: AppText.SEND,
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

