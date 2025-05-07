import 'package:flutter/material.dart';
import 'package:wonder_card_website/utils/wonder_card_strings.dart';
import 'package:wonder_card_website/wonder_card_website/views/pages/web_splash_page.dart';

final themeNotifier = ValueNotifier(ThemeMode.light);

class WonderCardWebsite extends StatelessWidget {
  WonderCardWebsite({super.key});
  final String routeName = RouteString.wondercardWebsite;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeNotifier,
      builder: (context, ThemeMode currentMode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Wond3rCard',
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.deepPurple,
            textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black,
              displayColor: Colors.black,
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.deepPurple,
            scaffoldBackgroundColor: Colors.black,
            textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
          ),
          themeMode: currentMode,
          home: const SplashScreen(),
        );
      },
    );
  }
}
