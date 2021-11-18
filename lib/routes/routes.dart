import 'package:flutter/material.dart';
import 'package:invent_chat/layout/base.dart';
import 'package:invent_chat/screens/games/games.dart';
import 'package:invent_chat/screens/login/login.dart';
import 'package:invent_chat/screens/login/otp.dart';
import 'package:invent_chat/screens/navigationScreen/navigationScreen.dart';
import 'package:invent_chat/screens/onboarding/onboarding.dart';
import 'package:invent_chat/screens/signin/signup.dart';
import 'package:invent_chat/screens/splash/splash.dart';
import 'package:invent_chat/screens/about/about.dart';
import 'package:invent_chat/screens/home/home.dart';

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
  static const signin= '/sign-in';
  static const login = '/login';
  static const otp = '/otp';
  static const webViewScreen = '/webview';
  static const about = '/about';
  static const home = '/home';
  static const onboarding = '/onboarding';
  static const navScreen = '/navScreen';

  /// Routing Table needed for the App.
  static Map<String, WidgetBuilder> get buildRoutes {
    return {
      splashScreen: (BuildContext context) =>
          const BaseLayout(page: SplashScreen(), isAppBar: false),
      signin: (BuildContext context) =>
          const BaseLayout(page: Signup(), isAppBar:  false),
      login: (BuildContext context) =>
          BaseLayout(page: Login(), isAppBar: false),
      otp: (BuildContext context) =>
          const BaseLayout(page: Otpverify(), isAppBar: false),
      about: (BuildContext context) =>
          BaseLayout(page: AboutScreen(), isAppBar: true),
      home: (BuildContext context) =>
          BaseLayout(page: HomeScreen(), isAppBar: false),
      onboarding: (BuildContext context) =>
          BaseLayout(page: Onbarding(), isAppBar: false),
      navScreen: (BuildContext context) =>
          BaseLayout(page: NavigationScreen(), isAppBar: false),

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
