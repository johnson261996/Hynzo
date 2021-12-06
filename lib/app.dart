import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hynzo/providers/auth_provider.dart';
import 'package:hynzo/providers/chat_provider.dart';
import 'package:hynzo/providers/game_provider.dart';
import 'package:hynzo/providers/interest_provider.dart';
import 'package:hynzo/providers/news_provider.dart';
import 'package:hynzo/providers/suggestion_provider.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/themes/themes.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => InterestProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SuggestionProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NewsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => GamesProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'HYNZO',
        debugShowCheckedModeBanner: false,
        theme: Themes.buildLightTheme(),
        initialRoute: Routes.initialRoute,
        routes: Routes.buildRoutes,
        onUnknownRoute:
            Routes.unknownRoute as Route<dynamic>? Function(RouteSettings)?,
        builder: EasyLoading.init(),
      ),
    );
  }
}
