import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:storybook/src/model/story_book_model.dart';

import 'module/home_module.dart';
import 'module/home_widget.dart';

storyBookHome(
    {List<Map<String, CupertinoThemeData>>? listCupertinoThemeData,
    List<Map<String, ThemeData>>? listThemeData,
    String? title,
    List<Locale>? supportedLocales,
    Widget? homeStory,
    bool isCupertino = false,
    required List<StoryBookModel> listStoryBookModel,
    Widget? logo}) {
  return ModularApp(
    module: HomeModule(listStoryBookModel, homeStory),
    child: HomeWidget(
      title: title ?? 'Storybook',
      logo:logo ?? SizedBox(),
      isCupertino: isCupertino,
      listThemeData: listThemeData ??
          [
            {'Default': ThemeData()}
          ],
      supportedLocales: supportedLocales ?? [Locale('pt', 'BR')],
    ),
  );
}
