import 'package:beehive_kitchen/extension/context_extension.dart';
import 'package:beehive_kitchen/ui/common/app_button.dart';
import 'package:beehive_kitchen/ui/common/title_with_price_item.dart';
import 'package:beehive_kitchen/ui/order-detail/order_detail_screen_bloc.dart';
import 'package:beehive_kitchen/utils/app_strings.dart';
import 'package:beehive_kitchen/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../helper/dialog_helper.dart';

class OrderDetailScreen extends StatelessWidget {
  static const String route = 'order_detail_screen_route';

  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    final bloc = context.read<OrderDetailScreenBloc>();
    final dialogHelper = DialogHelper.instance();

    return Scaffold(
      bottomNavigationBar: Material(
        elevation: 6,
        color: Colors.white,
        child: GestureDetector(
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
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 22,
                          color: Constants.colorOnSecondary,
                        )),
                    const Text('Order ID #1234',
                        style: TextStyle(
                            color: Constants.colorOnSecondary,
                            fontSize: 16,
                            fontFamily: Constants.cairoBold)),
                    const SizedBox()
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Divider(
                  thickness: 1,
                  color: Constants.colorTextLight2,
                  height: 1,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(width: 1, color: Constants.colorTextLight3)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(AppText.ORDER_ITEMS,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: Constants.cairoBold,
                                  color: Constants.colorOnSecondary)),
                          Icon(Icons.arrow_forward_ios_rounded,
                              color: Constants.colorTextLight, size: 18)
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      height: 1,
                      color: Constants.colorTextLight3,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset('assets/home_image1.png',
                                      width: 50, height: 60)),
                              const SizedBox(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Beef burger',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Constants.colorOnSecondary,
                                          fontFamily: Constants.cairoSemibold)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text('Quantity ',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily:
                                                  Constants.cairoRegular,
                                              color: Constants.colorTextLight)),
                                      Text('2',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Constants.colorPrimary,
                                              fontFamily:
                                                  Constants.cairoRegular)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('1.90',
                                  style: TextStyle(
                                      color: Constants.colorOnSecondary,
                                      fontSize: 14,
                                      fontFamily: Constants.cairoBold)),
                              Image.asset('assets/dollar.png',
                                  height: 10, width: 10),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        thickness: 1,
                        height: 1,
                        color: Constants.colorTextLight3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset('assets/home_image1.png',
                                      width: 50, height: 60)),
                              const SizedBox(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Beef burger',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Constants.colorOnSecondary,
                                          fontFamily: Constants.cairoSemibold)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text('Quantity ',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily:
                                                  Constants.cairoRegular,
                                              color: Constants.colorTextLight)),
                                      Text('2',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Constants.colorPrimary,
                                              fontFamily:
                                                  Constants.cairoRegular)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('1.90',
                                  style: TextStyle(
                                      color: Constants.colorOnSecondary,
                                      fontSize: 14,
                                      fontFamily: Constants.cairoBold)),
                              Image.asset('assets/dollar.png',
                                  height: 10, width: 10),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(AppText.NOTES,
                      style: TextStyle(
                          fontSize: 16,
                          color: Constants.colorOnSecondary,
                          fontFamily: Constants.cairoBold)),
                ),
              ),
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          width: 1, color: Constants.colorTextLight3)),
                  child: const Text(
                      'Lorem ipsum Lorem ipsumLorem ipsum Lorem ipsumLorem ipsum Lorem ipsumLorem ipsum Lorem ipsumLorem ipsum Lorem ipsumLorem ipsum Lorem ipsumLorem ipsum Lorem ipsum',
                      style: TextStyle(fontFamily: Constants.cairoRegular))),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(width: 1, color: Constants.colorTextLight3)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text('Bill',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Constants.colorOnSecondary,
                                  fontFamily: Constants.cairoBold)),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      height: 1,
                      color: Constants.colorTextLight3,
                    ),
                    const TitleWithPriceItem(title: 'Order', value: '1.90'),
                    const TitleWithPriceItem(title: 'Fees', value: '1.90'),
                    const TitleWithPriceItem(
                        title: 'All',
                        value: '21.80',
                        style: TextStyle(
                            color: Constants.colorOnSecondary,
                            fontSize: 18,
                            fontFamily: Constants.cairoBold)),
                  ],
                ),
              ),
            ],
          ),
        ),
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

