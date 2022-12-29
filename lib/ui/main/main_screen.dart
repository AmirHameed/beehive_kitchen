import 'package:beehive_kitchen/extension/context_extension.dart';
import 'package:beehive_kitchen/ui/main/main_screen_bloc.dart';
import 'package:beehive_kitchen/ui/main/main_screen_state.dart';
import 'package:beehive_kitchen/ui/main/navitem/category_nav_item_screen.dart';
import 'package:beehive_kitchen/ui/main/navitem/home_nav_item_screen.dart';
import 'package:beehive_kitchen/ui/main/navitem/notification_nav_item_screen.dart';
import 'package:beehive_kitchen/ui/main/navitem/order_screen.dart';
import 'package:beehive_kitchen/ui/main/navitem/profile_screen.dart';
import 'package:beehive_kitchen/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gif/flutter_gif.dart';

class MainScreen extends StatefulWidget {
  static const String route = 'main_screen_route';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  static const _homeNavigationKey =
  PageStorageKey(HomeNavigationItemScreen.key_title);
  static const _orderNavigationKey =
      PageStorageKey(OrderNavigationItemScreen.key_title);
  static const _categoryNavigationKey =
      PageStorageKey(CategoryNavigationItemScreen.key_title);
  static const _notificationNavigationKey =
      PageStorageKey(NotificationNavigationItemScreen.key_title);
  static const _profileNavigationKey =
      PageStorageKey(ProfileNavigationItemScreen.key_title);
  final _bottomMap = <PageStorageKey<String>, Widget>{};
  late FlutterGifController controller1,
      controller2,
      controller3,
      controller4,
      controller5;

  @override
  void initState() {
    controller1 = FlutterGifController(vsync: this);
    controller2 = FlutterGifController(vsync: this);
    controller3 = FlutterGifController(vsync: this);
    controller4 = FlutterGifController(vsync: this);
    controller5 = FlutterGifController(vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller1.repeat(
        min: 0,
        max: 65,
        period: const Duration(milliseconds: 1000),
      );
      Future.delayed(const Duration(seconds: 2))
          .then((value) => controller1.stop());
    });
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   controller2.repeat(
    //     min: 0,
    //     max: 33,
    //     period: const Duration(milliseconds: 500),
    //   );
    //   Future.delayed(const Duration(seconds: 1))
    //       .then((value) => controller2.stop());
    // });
    //
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   controller3.repeat(
    //     min: 0,
    //     max: 28,
    //     period: const Duration(milliseconds: 1000),
    //   );
    //   Future.delayed(const Duration(seconds: 2)).then((value) => controller3.stop());
    // });
    //
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   controller4.repeat(
    //     min: 0,
    //     max: 40,
    //     period: const Duration(milliseconds: 1000),
    //   );
    //   Future.delayed(const Duration(seconds: 2)).then((value) => controller4.stop());
    // });
    //
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   controller5.repeat(
    //     min: 0,
    //     max: 54,
    //     period: const Duration(milliseconds: 1000),
    //   );
    //   Future.delayed(const Duration(seconds: 2)).then((value) => controller5.stop());
    // });

    _bottomMap[_homeNavigationKey] = const HomeNavigationItemScreen(key: _homeNavigationKey);
    _bottomMap[_orderNavigationKey] = const SizedBox();
    _bottomMap[_notificationNavigationKey] = const SizedBox();
    _bottomMap[_profileNavigationKey] = const SizedBox();
    _bottomMap[_categoryNavigationKey] = const SizedBox();

    final mySystemTheme = SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Constants.colorOnSurface);
    SystemChrome.setSystemUIOverlayStyle(mySystemTheme);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _bottomNavItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: const Image(
            image: AssetImage('assets/home.png'), width: 25, height: 25),
        label: '',
        activeIcon: GifImage(
            controller: controller1,
            image: const AssetImage("assets/home_selected.gif"),
            width: 25,
            height: 25),
      ),
      BottomNavigationBarItem(
        label: '',
        icon: const Image(
            image: AssetImage('assets/order_unfill.png'),
            width: 25,
            height: 25),
        activeIcon: GifImage(
            controller: controller2,
            image: const AssetImage("assets/order_fill.gif"),
            width: 25,
            height: 25),
      ),
      BottomNavigationBarItem(
          icon: const Image(
              image: AssetImage('assets/category_unfil.png'),
              width: 25,
              height: 25),
          label: '',
          activeIcon: GifImage(
              controller: controller3,
              image: const AssetImage("assets/category_fill.gif"),
              width: 25,
              height: 25)),
      BottomNavigationBarItem(
          icon: const Image(
              image: AssetImage('assets/notification.png'),
              width: 25,
              height: 25),
          label: '',
          activeIcon: GifImage(
              controller: controller4,
              image: const AssetImage("assets/notification_selected.gif"),
              width: 25,
              height: 25)),
      BottomNavigationBarItem(
          label: '',
          icon: const Image(
              image: AssetImage('assets/profile_unfill.png'),
              width: 25,
              height: 25),
          activeIcon: GifImage(
              controller: controller5,
              image: const AssetImage("assets/profile_fill.gif"),
              width: 25,
              height: 25)),
    ];

    final size = context.screenSize;
    final bloc = context.read<MainScreenBloc>();

    final mySystemTheme = SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Constants.colorOnPrimary);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

    SystemChrome.setSystemUIOverlayStyle(mySystemTheme);
    return Scaffold(
      bottomNavigationBar: BlocBuilder<MainScreenBloc, MainScreenState>(
          buildWhen: (previous, current) => previous.index != current.index,
          builder: (_, state) {
            return ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(24), topLeft: Radius.circular(24)),
              child: BottomNavigationBar(
                key: bloc.globalKey,
                onTap: (int newIndex) {
                  if (state.index == newIndex) return;
                  final pageStorageKey = _bottomMap.keys.elementAt(newIndex);
                  final bottomItem = _bottomMap[pageStorageKey];
                  if (bottomItem == null || bottomItem is SizedBox) {
                    final newBottomWidget = _getNavigationWidget(newIndex);
                    _bottomMap[pageStorageKey] = newBottomWidget;
                  }
                  bloc.updateIndex(newIndex);
                  if (newIndex == 0) {
                    controller1.repeat(
                      min: 0,
                      max: 65,
                      period: const Duration(milliseconds: 900),
                    );
                    Future.delayed(const Duration(milliseconds: 900))
                        .then((value) { controller1.stop();
                    controller1.animateTo(65,duration: const Duration(milliseconds: 0));});
                  }
                  if (newIndex == 1) {
                    controller2.repeat(
                      min: 0,
                      max: 33,
                      period: const Duration(milliseconds: 700),
                    );
                    Future.delayed(const Duration(milliseconds: 700))
                        .then((value) { controller2.stop();
                    controller2.animateTo(33,duration: const Duration(milliseconds: 0));});
                  }
                  if (newIndex == 2) {
                    controller3.repeat(
                      min: 0,
                      max: 28,
                      period: const Duration(milliseconds: 650),
                    );

                    Future.delayed(const Duration(milliseconds: 650))
                        .then((value) { controller3.stop();
                    controller3.animateTo(28,duration: const Duration(milliseconds: 0));});
                  }
                  if (newIndex == 3) {
                    controller4.repeat(
                      min: 0,
                      max: 40,
                      period: const Duration(milliseconds: 800),
                    );
                    Future.delayed(const Duration(milliseconds: 800))
                        .then((value) { controller4.stop();
                    controller4.animateTo(40,duration: const Duration(milliseconds: 0));});
                  }
                  if (newIndex == 4) {
                    controller5.repeat(
                      min: 0,
                      max: 54,
                      period: const Duration(milliseconds: 870),
                    );
                    Future.delayed(const Duration(milliseconds: 870))
                        .then((value) { controller5.stop();
                    controller5.animateTo(54,duration: const Duration(milliseconds: 0));});
                  }
                },
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: _bottomNavItems,
                currentIndex: state.index,
                elevation: 12,
                backgroundColor: Constants.colorPrimary,
                type: BottomNavigationBarType.fixed,
              ),
            );
          }),
      body: SafeArea(
          child: WillPopScope(
              onWillPop: () async => false,
              child: SizedBox(
                width: size.width,
                height: size.height - kBottomNavigationBarHeight,
                child: BlocBuilder<MainScreenBloc, MainScreenState>(
                    buildWhen: (previous, current) =>
                        previous.index != current.index,
                    builder: (_, state) => IndexedStack(
                        index: state.index,
                        children: _bottomMap.values.toList())),
              ))),
    );
  }

  Widget _getNavigationWidget(int index) {
    switch (index) {
      case 0:
        return const HomeNavigationItemScreen(key: _homeNavigationKey);
      case 1:
        return const OrderNavigationItemScreen(key: _orderNavigationKey);
      case 2:
        return const CategoryNavigationItemScreen(key: _categoryNavigationKey);
      case 3:
        return const NotificationNavigationItemScreen(
            key: _notificationNavigationKey);
      case 4:
        return const ProfileNavigationItemScreen(key: _profileNavigationKey);
      default:
        return const SizedBox();
    }
  }
}
