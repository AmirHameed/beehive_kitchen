import 'dart:io';

import 'package:beehive_kitchen/extension/context_extension.dart';
import 'package:beehive_kitchen/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:image_picker/image_picker.dart';
import '../helper/dialog_helper.dart';
import '../utils/constants.dart';
import 'common/app_button.dart';
import 'common/app_text_field.dart';

class RestaurantDetailScreen extends StatelessWidget {

  static const String route='restaurant_detail_screen_route';

  const RestaurantDetailScreen({super.key});



  @override
  Widget build(BuildContext context) {
    final dialogHelper = DialogHelper.instance();

    return Scaffold(
        body: SafeArea(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context, true),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 16,
                        color: Constants.colorOnSecondary,
                      )),
                  const Text('Beef burgur',
                      style: TextStyle(
                          color: Constants.colorOnSecondary,
                          fontSize: 16,
                          fontFamily: Constants.cairoBold)),
                  GestureDetector(
                    onTap: () {
                      showAddProductSheet(context,true);
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
            Expanded(
              child: ListView.separated(
                itemCount: 5,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                separatorBuilder: (_, index) => const SizedBox(height: 8),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (_, index) => Slidable(
                  endActionPane:
                  ActionPane(
                      extentRatio: 0.4,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                            onPressed: (_){
                              dialogHelper
                                ..injectContext(context)
                                ..showDeleteDialogCart();
                            },
                            backgroundColor: Colors.red,
                            icon:Image.asset('assets/Delete square.png'),
                            label: '',
                            borderRadius: BorderRadius.circular(12),
                            padding: const EdgeInsets.only(top: 10),
                            spacing: 0),
                        const SizedBox(width: 5),
                        SlidableAction(
                            onPressed: (_){
                              showAddProductSheet(context, false);
                            },
                            backgroundColor: const Color(0xffFFC608),
                            icon:Image.asset('assets/Edit Square.png'),
                            label: '',
                            borderRadius: BorderRadius.circular(12),
                            padding: const EdgeInsets.only(top: 10),
                            spacing: 0),
                      ]),
                  child: GestureDetector(
                    onTap: (){},
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Constants.colorOnSurface,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 90,
                              width: 90,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child:  Image(
                                    image: AssetImage(
                                        index.isOdd? 'assets/burgur1.png':'assets/burgur2.png'),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(top: 0, left: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text('Beef burgur',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: Constants.cairoBold,
                                          color: Constants.colorOnSecondary,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 5),
                                  Text('Lorem ipsum Lorem ipsum',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: Constants.cairoSemibold,
                                          color: Constants.colorTextLight)),
                                  SizedBox(height: 5),
                                  Text('23.45 \$',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: Constants.cairoBold,
                                          color: Constants.colorPrimary)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],),
        ));
  }
}

showAddProductSheet(BuildContext context,bool isAdd) {
  final _formkey = GlobalKey<FormState>();
  final size = context.screenSize;
  XFile? file;
  Function? setSetterFile;

  return showModalBottomSheet(
    context: context,
    enableDrag: true,
    isDismissible: true,
    isScrollControlled: true,
    constraints: BoxConstraints(maxHeight: size.height/1.1,minHeight: size.height/1.3),
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
    ),
    builder: (context) {
      return SingleChildScrollView(
        child: Column(
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
             Text(isAdd? AppText.ADD_PRODUCT:AppText.EDIT_PRODUCT,
                style: const TextStyle(
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
                    const Text(AppText.PRODUCT_NAME,
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
                                hintText: AppText.ENTER_PRODUCT_NAME ,
                                hintStyle: TextStyle(
                                    color: Constants.colorTextLight,
                                    fontFamily: Constants.cairoRegular,
                                    fontSize: 13)))),
                    const Text(AppText.PRODUCT_PRICE,
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
                                hintText: AppText.ENTER_PRODUCT_PRICE ,
                                hintStyle: TextStyle(
                                    color: Constants.colorTextLight,
                                    fontFamily: Constants.cairoRegular,
                                    fontSize: 13)))),

                    const Text(AppText.PRODUCT_PHOTO,
                        style: TextStyle(
                            fontSize: 16,
                            color: Constants.colorOnSecondary,
                            fontFamily: Constants.cairoSemibold)),
                    AppTextField(
                        hint: 'Choose Photo',
                        suffixIcon: GestureDetector(
                          onTap: () async {
                            final fileData=await ImagePicker().pickImage(source: ImageSource.gallery);
                            if(fileData==null) return;
                            setSetterFile?.call(()=>file=fileData);
                            },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 120,
                            decoration: BoxDecoration(
                                color: Constants.colorLightPink,
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: const Text(AppText.UPLOAD,style: TextStyle(fontSize: 14,color: Constants.colorPrimary,fontFamily: Constants.cairoRegular)),
                          ),
                        ),
                        textInputType: TextInputType.text,
                        isError: false),
                    StatefulBuilder(
                      builder: (_,setState){
                        setSetterFile=setState;
                      return file!=null?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 90,
                              width: 90,
                              child: Stack(
                              children:   [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child:  Image(image: FileImage(File(file!.path)),fit: BoxFit.cover,width: 80,height: 80)),
                                  ),
                                ),
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: GestureDetector(
                                            onTap: (){
                                              setSetterFile?.call(()=>file=null);
                                            },
                                            child: Container(
                                                decoration: const BoxDecoration(shape: BoxShape.circle,color: Constants.colorPrimary),width: 20,height: 20,
                                                child: const Icon(Icons.clear,color: Constants.colorOnPrimary,size: 12),),
                                        ),
                                      ),
                              ],
                      ),
                            ),
                          ],
                        ):const SizedBox();
                      }
                    ),

                    const Text(AppText.DETAILS,
                        style: TextStyle(
                            fontSize: 16, color: Constants.colorOnSecondary, fontFamily: Constants.cairoSemibold)),
                    Container(
                        height: 100,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        margin: const EdgeInsets.only(
                            bottom: 20, top: 10, left: 0, right: 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Constants.colorTextLight)),
                        child: TextFormField(
                            controller: TextEditingController(),
                            maxLines: 5,
                            onChanged: (String? value) {},
                            keyboardType: TextInputType.text,
                            style: const TextStyle(
                                color: Constants.colorOnSecondary, fontSize: 14),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: AppText.ENTER_DETAILS ,
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

                    const SizedBox(height: 10)

                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

