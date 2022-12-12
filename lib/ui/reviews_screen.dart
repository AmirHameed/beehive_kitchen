import 'package:beehive_kitchen/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewsScreen extends StatelessWidget {
  static const String route = 'reviews_screen';
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                GestureDetector(
                    onTap: ()=>Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios,size: 16,color: Constants.colorOnSecondary,)),
                 const Text('My Reviews',
                    style: TextStyle(
                        color: Constants.colorOnSecondary,
                        fontSize: 16,
                        fontFamily: Constants.cairoBold)),
                const SizedBox()


              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: Constants.colorTextLight2,
            height: 1,
          ),

          Expanded(
            child: ListView.separated(
                itemCount: 10,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (_, __) => const SizedBox(),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                scrollDirection: Axis.vertical,
                itemBuilder: (_, index) => Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Constants.colorOnSurface,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset('assets/profile.png', width: 40, height: 40),

                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children:  const [
                                Text('Mohammad Mehryar',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Constants.colorOnSecondary,
                                        fontFamily: Constants.cairoBold)),
                                Text('12/3/2022',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Constants.colorTextLight,
                                        fontFamily: Constants.cairoRegular)),
                              ],
                            ),
                            const SizedBox(height: 10),

                            Row(
                              children: [
                                const Text('4.0',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Constants.colorTextLight,
                                        fontFamily: Constants.cairoRegular)),
                                RatingBar(
                                    initialRating:  3.0,
                                    itemSize: 10,
                                    itemPadding: const EdgeInsets.symmetric(horizontal: 2),
                                    allowHalfRating: true,
                                    ratingWidget: RatingWidget(
                                        full:  Image.asset('assets/full.png', width: 20,height: 20,fit: BoxFit.cover),
                                        half: const Icon(Icons.star_half, size: 30),
                                        empty: Image.asset('assets/empty.png', width: 35,height: 35,fit: BoxFit.cover)),
                                    onRatingUpdate: (_) {},
                                    ignoreGestures: true),
                              ],
                            ),
                            const SizedBox(height: 5),
                            const Text('Lorem ipsum Lorem ipsumLorem ipsum Lorem ipsum Lorem ipsum Lorem.',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Constants.colorOnSecondary,
                                    fontFamily: Constants.cairoSemibold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ),
        ]),
      ),
    );
  }
}
