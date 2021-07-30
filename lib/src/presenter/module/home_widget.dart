import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:storybook/src/components/menu/custom_main_slide.dart';

class HomeWidget extends StatelessWidget {
  final String title;
  final List<Locale> supportedLocales;
  final bool isCupertino;
  final Widget logo;
  final List<Map<String, ThemeData>> listThemeData;

  HomeWidget(
      {Key? key,
      required this.title,
      required this.supportedLocales,
      required this.isCupertino,
      required this.listThemeData,
      required this.logo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: supportedLocales,
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        title: title,
        builder: (ctx, child) => CustomMainSlide(
              child: child ?? SizedBox(),
              listThemeData: listThemeData,
          logo:logo,
              supportedLocales: supportedLocales,
              title: title,
            )).modular();
  }
}
