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

class MainScreen extends StatefulWidget {
  static const String route = 'main_screen_route';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const _homeNavigationKey = PageStorageKey(HomeNavigationItemScreen.key_title);
  static const _orderNavigationKey = PageStorageKey(OrderNavigationItemScreen.key_title);
  static const _categoryNavigationKey = PageStorageKey(CategoryNavigationItemScreen.key_title);
  static const _notificationNavigationKey = PageStorageKey(NotificationNavigationItemScreen.key_title);
  static const _profileNavigationKey = PageStorageKey(ProfileNavigationItemScreen.key_title);
  final _bottomMap = <PageStorageKey<String>, Widget>{};


  @override
  void initState() {
    _bottomMap[_homeNavigationKey] =  const HomeNavigationItemScreen(key: _homeNavigationKey);
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

  final _bottomNavItems = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
        icon: Image(
            image: AssetImage('assets/home.png'),
            width: 25,
            height: 25),
        label: '',
        activeIcon: Image(
            image: AssetImage('assets/home_selected.png'),
            width: 25,
            height: 25)),
    const BottomNavigationBarItem(
        label: '',
        icon: Image(image: AssetImage('assets/order_unfill.png'), width: 25, height: 25),
        activeIcon: Image(
            image: AssetImage('assets/order_fill.png'),
            width: 25,
            height: 25)),
    const BottomNavigationBarItem(
        icon: Image(
            image: AssetImage('assets/category_unfil.png'),
            width: 25,
            height: 25),
        label: '',
        activeIcon: Image(
          image: AssetImage('assets/category_fill.png'),
          width: 25,
          height: 25,
        )),
    const BottomNavigationBarItem(
        icon: Image(
            image: AssetImage('assets/notification.png'),
            width: 25,
            height: 25),
        label: '',
        activeIcon: Image(
          image: AssetImage('assets/notification_selected.png'),
          width: 25,
          height: 25,
        )),
    const BottomNavigationBarItem(
        label: '',
        icon: Image(image: AssetImage('assets/profile_unfill.png'), width: 25, height: 25),
        activeIcon: Image(
            image: AssetImage('assets/profile_fill.png'),
            width: 25,
            height: 25)),
  ];

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    final bloc = context.read<MainScreenBloc>();

    final mySystemTheme = SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Constants.colorOnPrimary);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

    SystemChrome.setSystemUIOverlayStyle(mySystemTheme);
    return Scaffold(
        bottomNavigationBar: BlocBuilder<MainScreenBloc, MainScreenState>(
            buildWhen: (previous, current) => previous.index != current.index,
            builder: (_, state) {
              return ClipRRect(
                borderRadius: const BorderRadius.only(topRight: Radius.circular(24), topLeft: Radius.circular(24)),
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
                ))),);
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
        return const NotificationNavigationItemScreen(key: _notificationNavigationKey);
      case 4:
        return const ProfileNavigationItemScreen(key: _profileNavigationKey);
      default:
        return const SizedBox();
    }
  }
}
