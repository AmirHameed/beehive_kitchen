import 'dart:async';
import 'package:beehive_kitchen/extension/context_extension.dart';
import 'package:beehive_kitchen/ui/order_tracking_screen_bloc.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../utils/app_strings.dart';
import '../utils/constants.dart';
import 'common/app_button.dart';

class OrderTrackingScreen extends StatefulWidget {
  static const String route = 'order_tracking_screen_route';

  const OrderTrackingScreen({Key? key}) : super(key: key);
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    final bloc = context.read<OrderTrackingScreenBloc>();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: GoogleMap(
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                mapType: MapType.normal,
                initialCameraPosition: OrderTrackingScreen._kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 180, right: 50),
                  child: Image.asset('assets/on_tracking_imag.png',
                      width: 250, height: 250),
                )),
            Positioned(
              top: 30,
              left: 0,
              right: 0,
              child: Container(
                  width: size.width,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12)),
                  child: BlocBuilder<OrderTrackingScreenBloc, int>(
                    builder: (_, state) => Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Stepper(
                            index: 0,
                            onTap: (){},
                            text: AppText
                                .THE_DRIVER_IS_HEADING_TO_THE_PICKUP_LOCATION),
                         Stepper(
                             index:1,
                            text: AppText
                                .THE_DRIVER_REACED_AT_THE_TOP_PICKUP_LOCATION,
                           onTap: (){
                              if(state<=1){
                                bloc.updateTracking();
                              }}),
                        Stepper(
                            index:2,
                            text: AppText
                                .THE_DRIVER_HAS_PICKED_YOUR_ORDER_AND_ON_HIS_WAY_TO_YOU,
                            onTap: (){
                              if(state<=2){
                                bloc.updateTracking();
                              }}),
                        Stepper(
                            index:3,
                            text: AppText
                                .THE_DRIVER_HAS_ARRIVED_AT_THE_DELIVERY_POINT,
                            onTap: (){
                              if(state<=3){
                                bloc.updateTracking();
                              }},
                            isDotted: false)
                      ],
                    ),
                  )),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset('assets/map_current_location.png',
                      width: 60, height: 60)),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back_ios,
                            size: 22, color: Constants.colorOnSecondary)),
                    const Text(AppText.ORDER_TRACKING,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: Constants.cairoBold,
                            color: Constants.colorOnSecondary)),
                    const SizedBox()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Stepper extends StatelessWidget {
  final bool isDotted;
  final String text;
  final VoidCallback onTap;
  final int index;

  const Stepper(
      {super.key, this.isDotted = true, required this.text,required this.onTap,required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderTrackingScreenBloc,int>(
      builder:(_,state)=>
       Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(120),
                shadowColor: Colors.grey,
                child: Container(
                  width: 25,
                  height: 25,
                  padding: const EdgeInsets.all(0.0),
                  decoration: const BoxDecoration(
                    color: Constants.colorOnPrimary,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Center(
                      child: Icon(
                    Icons.circle,
                    color: state>=index? Constants.colorPrimary
                        : Constants.colorDotLine,
                    size: 20,
                  )),
                ),
              ),
              isDotted
                  ?  DottedLine(
                      direction: Axis.vertical,
                      lineLength:index==0? 20:index==2?60:30,
                      lineThickness: 2.0,
                      dashLength: 6.0,
                      dashColor: Constants.colorDotLine,
                      dashRadius: 0.0,
                      dashGapLength: 4.0,
                      dashGapColor: Colors.transparent,
                      dashGapRadius: 0.0,
                    )
                  : const SizedBox()
            ],
          ),
          const SizedBox(width: 5),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyle(
                    fontFamily: Constants.cairoSemibold,
                    fontSize: 14,
                    color: state>=index
                        ? Constants.colorOnSecondary
                        : Constants.colorDotLine),
              ),
              index==0?
              const SizedBox():
              SizedBox(
                  width: 50,
                  height: 30,
                  child: AppButton(text: AppText.ARRIVED, onClick: onTap,borderRadius: 8,fontStyle: const TextStyle(fontFamily: Constants.cairoMedium,fontSize: 12,color: Colors.white),color:state==index? Constants.colorPrimary:state>index?Constants.colorPrimary.withOpacity(0.3):Colors.grey))
            ],
          ))
        ],
      ),
    );
  }
}
