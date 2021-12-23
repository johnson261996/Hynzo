import 'package:flutter/material.dart';
import 'package:hynzo/layout/base.dart';
import 'package:hynzo/screens/home/edit_home.dart';
import 'package:hynzo/screens/interest/interest.dart';
import 'package:hynzo/screens/intro/intro.dart';
import 'package:hynzo/screens/location/location.dart';
import 'package:hynzo/screens/login/login.dart';
import 'package:hynzo/screens/login/otp.dart';
import 'package:hynzo/screens/navigationScreen/navigationScreen.dart';
import 'package:hynzo/screens/news/news.dart';
import 'package:hynzo/screens/onboarding/onboarding.dart';
import 'package:hynzo/screens/splash/splash.dart';
import 'package:hynzo/screens/about/about.dart';
import 'package:hynzo/screens/home/home.dart';
import 'package:hynzo/screens/suggestion/suggetion.dart';
import 'package:hynzo/screens/webview/webviewscreen.dart';

/// [Routes] which contains common routing configuaration needed for the Application.
/// This includes all pages and all routes mapped to each other.
/// This also includes Routing table and Route for Unhandled routes.
/// Use [Routes] in MaterialApp:
///  ```dart
///  MaterialApp(
///    title: 'Flutter_App',
///    routes: Routes.buildRoutes,
///    initialRoute: Routes.login,
///    onUnknownRoute: Routes.unknownRoute,
///  );
///  ```

class Routes {
  Routes._();

  // routes
  static const splashScreen = '/splash-screen';
  static const login = '/login';
  static const intro = '/intro';
  static const otp = '/otp';
  static const about = '/about';
  static const interest = '/interest';
  static const location = '/location';
  static const suggetion = '/suggetion';
  static const onboarding = '/onboarding';
  static const navScreen = '/navScreen';
  static const news="./news";
  static const webview="./webview";
  static const edit_home = "./edithome";

  /// Routing Table needed for the App.
  static Map<String, WidgetBuilder> get buildRoutes {
    return {
      splashScreen: (BuildContext context) =>
          const BaseLayout(page: SplashScreen(), isAppBar: false),
      login: (BuildContext context) =>
          BaseLayout(page: Login(), isAppBar: false),
      intro: (BuildContext context) =>
          BaseLayout(page: Intro(), isAppBar: false),
      interest: (BuildContext context) =>
          BaseLayout(page: Interest(), isAppBar: false),
      location: (BuildContext context) =>
          BaseLayout(page: Location(), isAppBar: false),
      suggetion: (BuildContext context) =>
          BaseLayout(page: Suggetion(), isAppBar: false),
      otp: (BuildContext context) =>
          const BaseLayout(page: Otpverify(), isAppBar: false),
      about: (BuildContext context) =>
          BaseLayout(page: AboutScreen(), isAppBar: true),
      onboarding: (BuildContext context) =>
          BaseLayout(page: Onbarding(), isAppBar: false),
      navScreen: (BuildContext context) =>
          BaseLayout(page: NavigationScreen(), isAppBar: false),
      news: (BuildContext context) =>
          BaseLayout(page: News(), isAppBar: false),
      webview: (BuildContext context) =>
          BaseLayout(page: WebViewScreen(), isAppBar: false),
      edit_home: (BuildContext context) =>
          BaseLayout(page: EditHome(), isAppBar: false),
    };
  }

  /// Handler for Error and Unhandled pages.
  static Function get unknownRoute {
    return (settings) {
      MaterialPageRoute(
        builder: (ctx) => const SplashScreen(),
      );
    };
  }

  /// Configures the initial route.
  static String get initialRoute {
    return Routes.splashScreen;
  }
}
