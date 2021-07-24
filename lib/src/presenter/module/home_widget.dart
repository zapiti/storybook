import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:storybook/src/components/menu/custom_main_slide.dart';

class HomeWidget extends StatelessWidget {
  ThemeData themeData;
  CupertinoThemeData cupertinoThemeData;
  String title;
  List<Locale> supportedLocales;
  bool isCupertino;

  HomeWidget(
      {Key? key,
      required this.themeData,
      required this.title,
      required this.cupertinoThemeData,
      required this.supportedLocales,
      required this.isCupertino})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isCupertino
        ? CupertinoApp(
                localizationsDelegates: [
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
                supportedLocales: supportedLocales,
                theme: cupertinoThemeData,
                debugShowCheckedModeBanner: false,
                title: title,
                builder: (ctx, child) => (CustomMainSlide(child ?? SizedBox())))
            .modular()
        : MaterialApp(
                localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
                supportedLocales: supportedLocales,
                theme: themeData,
                debugShowCheckedModeBanner: false,
                title: title,
                builder: (ctx, child) => (CustomMainSlide(child ?? SizedBox())))
            .modular();
  }
}
