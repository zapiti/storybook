import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:storybook/src/model/story_book_model.dart';

import 'module/home_module.dart';
import 'module/home_widget.dart';

storyBookHome(
    {ThemeData? themeData,
    CupertinoThemeData? cupertinoThemeData,
    String? title,
    List<Locale>? supportedLocales,
      Widget? homeStory,
    bool isCupertino = false,
    required List<StoryBookModel> listStoryBookModel}) {
  return ModularApp(
    module: HomeModule(listStoryBookModel,homeStory),
    child: HomeWidget(
      title: title ?? 'Storybook',
      isCupertino: isCupertino,
      themeData: themeData ?? ThemeData(),
      cupertinoThemeData: cupertinoThemeData ?? CupertinoThemeData(),
      supportedLocales: supportedLocales ?? [Locale('pt', 'BR')],
    ),
  );
}
