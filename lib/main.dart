import 'dart:io';
import 'package:beehive_kitchen/translation/codegen_loader.g.dart';
import 'package:beehive_kitchen/ui/auth/forgot_password_screen.dart';
import 'package:beehive_kitchen/ui/auth/login_screen.dart';
import 'package:beehive_kitchen/ui/auth/login_screen_bloc.dart';
import 'package:beehive_kitchen/ui/auth/new_password_screen.dart';
import 'package:beehive_kitchen/ui/auth/new_password_screen_bloc.dart';
import 'package:beehive_kitchen/ui/auth/otp_screen.dart';
import 'package:beehive_kitchen/ui/auth/signup_profile_screen.dart';
import 'package:beehive_kitchen/ui/auth/signup_profile_screen_bloc.dart';
import 'package:beehive_kitchen/ui/auth/signup_screen.dart';
import 'package:beehive_kitchen/ui/category-detail/category_detail_screen.dart';
import 'package:beehive_kitchen/ui/category-detail/category_detail_screen_bloc.dart';
import 'package:beehive_kitchen/ui/choose_delivery_address_screen.dart';
import 'package:beehive_kitchen/ui/main/navitem/cart_nav_item_screen.dart';
import 'package:beehive_kitchen/ui/my_address_screen.dart';
import 'package:beehive_kitchen/ui/my_information_screen.dart';
import 'package:beehive_kitchen/ui/order-detail/order_detail_screen_bloc.dart';
import 'package:beehive_kitchen/ui/order-detail/order_detail_screen.dart';
import 'package:beehive_kitchen/ui/order_tracking_screen.dart';
import 'package:beehive_kitchen/ui/order_tracking_screen_bloc.dart';
import 'package:beehive_kitchen/ui/payment_method_screen.dart';
import 'package:beehive_kitchen/ui/product_screen.dart';
import 'package:beehive_kitchen/ui/provider_offers_screen.dart';
import 'package:beehive_kitchen/ui/resturant_detail_screen.dart';
import 'package:beehive_kitchen/ui/chat_screen.dart';
import 'package:beehive_kitchen/ui/reviews_screen.dart';
import 'package:beehive_kitchen/ui/setting/setting_screen.dart';
import 'package:beehive_kitchen/ui/setting/setting_screen_bloc.dart';
import 'package:beehive_kitchen/ui/splash_screen.dart';
import 'package:beehive_kitchen/ui/main/main_screen.dart';
import 'package:beehive_kitchen/ui/main/main_screen_bloc.dart';
import 'package:beehive_kitchen/ui/we_will_contact_screen.dart';
import 'package:beehive_kitchen/utils/app_strings.dart';
import 'package:beehive_kitchen/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final deviceLocale = Platform.localeName;
  final countryCode = deviceLocale.split('_')[0];
  runApp(EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      assetLoader: const CodegenLoader(),
      startLocale: Locale(countryCode),
      fallbackLocale: Locale(countryCode),
      child: const _App()));
}

final _mySystemTheme = SystemUiOverlayStyle.light.copyWith(
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    statusBarColor: Constants.colorOnSurface);

const _colorScheme = ColorScheme(
    primary: Constants.colorPrimary,
    primaryContainer: Constants.colorPrimaryVariant,
    secondary: Constants.colorSecondaryVariant,
    secondaryContainer: Constants.colorSecondaryVariant,
    surface: Constants.colorSurface,
    background: Constants.colorBackground,
    error: Constants.colorError,
    onPrimary: Constants.colorOnPrimary,
    onSecondary: Constants.colorOnSecondary,
    onSurface: Constants.colorOnSurface,
    onBackground: Constants.colorOnBackground,
    onError: Constants.colorOnError,
    brightness: Brightness.light);

ThemeData _buildAppThemeData() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      colorScheme: _colorScheme,
      primaryColor: Constants.colorPrimary,
      unselectedWidgetColor: Constants.colorOnIcon,
      scaffoldBackgroundColor: Constants.colorOnSurface,
      errorColor: Constants.colorError);
}

class _AppRouter {
  Route _getPageRoute(Widget screen) => Platform.isIOS
      ? CupertinoPageRoute(builder: (_) => screen)
      : MaterialPageRoute(builder: (_) => screen);

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.route:
        return _getPageRoute(const SplashScreen());
      case WeWillContactYouScreen.route:
        return _getPageRoute(const WeWillContactYouScreen());
      case LoginScreen.route:
        return _getPageRoute(BlocProvider(
            create: (_) => LoginScreenBloc(),
            child: const LoginScreen()));
      case SignUpScreen.route:
        return _getPageRoute(const SignUpScreen());
      case OTPScreen.route:
        final argument=settings.arguments as bool;
        return _getPageRoute(OTPScreen(isLogin: argument));
      case SignUpProfileScreen.route:
        return _getPageRoute(BlocProvider(
            create: (_) => SignUpProfileScreenBloc(),
            child: const SignUpProfileScreen()));
      case MainScreen.route:
        return _getPageRoute(BlocProvider(
            create: (_) => MainScreenBloc(), child: const MainScreen()));
      case MyInformationScreen.route:
        return _getPageRoute(const MyInformationScreen());
      case SettingScreen.route:
        return _getPageRoute(BlocProvider(
            create: (_) => SettingScreenBloc(), child: const SettingScreen()));
      case MyAddressScreen.route:
        final argument = settings.arguments as bool;
        return _getPageRoute(MyAddressScreen(isShippingAddress: argument));
      case ChooseDeliveryAddressScreen.route:
        final argument = settings.arguments as bool?;
        return _getPageRoute(ChooseDeliveryAddressScreen(isEdit: argument??false));
      case PaymentMethodScreen.route:
        return _getPageRoute(const PaymentMethodScreen());
      case OrderDetailScreen.route:
        final argument = settings.arguments as List<bool>;
        final bool isStartOrder=argument.first;
        final bool isStartOrderCondition=argument.last;
        return _getPageRoute(BlocProvider(
            create: (_) => OrderDetailScreenBloc(isStartOrder:isStartOrder,isStartOrderCondition: isStartOrderCondition),
            child: const OrderDetailScreen()));
      case RestaurantDetailScreen.route:
        return _getPageRoute(const RestaurantDetailScreen());
      case CategoriesDetailScreen.route:
        return _getPageRoute(BlocProvider(
            create: (_) => CategoryDetailScreenBloc(),
            child: const CategoriesDetailScreen()));
      case ProductScreen.route:
        return _getPageRoute(const ProductScreen());
      case CartNavigationItemScreen.route:
        return _getPageRoute(const CartNavigationItemScreen(isBottom: true));
      case ProviderOfferScreen.route:
        return _getPageRoute(const ProviderOfferScreen());
      case ChatScreen.route:
        return _getPageRoute(const ChatScreen());
      case OrderTrackingScreen.route:
        return _getPageRoute(BlocProvider(
            create: (_) => OrderTrackingScreenBloc(),
            child: const OrderTrackingScreen()));
      case ReviewsScreen.route:
        return _getPageRoute(const ReviewsScreen());
      case ForgotPasswordScreen.route:
        return _getPageRoute(ForgotPasswordScreen());
      case NewPasswordScreen.route:
        return _getPageRoute(BlocProvider(
            create: (_) => NewPasswordScreenBloc(),
            child: NewPasswordScreen()));
    }
    return null;
  }

  void dispose() {}
}

class _App extends StatefulWidget {
  const _App();

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<_App> with WidgetsBindingObserver {
  final _AppRouter __appRouter = _AppRouter();

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(_mySystemTheme);
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    _setLanguage();
    super.didChangeLocales(locales);
  }

  void _setLanguage() async {
    final deviceLocale = Platform.localeName;
    final countryLanguage = deviceLocale.split('_')[0];
    if (countryLanguage == 'de') {
      await context.setLocale(const Locale('de'));
    } else {
      await context.setLocale(const Locale('en'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: AppText.APP_NAME,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: __appRouter.onGenerateRoute,
        theme: _buildAppThemeData());
  }

  @override
  void dispose() {
    __appRouter.dispose();
    super.dispose();
  }
}
