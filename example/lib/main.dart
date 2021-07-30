import 'dart:html';

import 'package:example/menu_secundario/button_file.dart';
import 'package:example/menu_principal/card_sucess.dart';
import 'package:example/menu_principal/button_win.dart';
import 'package:example/story/menu_principal/card_error.dart';
import 'package:example/story/menu_principal/button_win.dart';
import 'package:example/story/menu_principal/card_sucess.dart';
import 'package:example/story/menu_secundario/button_file.dart';
import 'package:flutter/material.dart';
import 'package:storybook/storybook.dart';

import 'menu_principal/card_error.dart';

void main() {
  runApp(storyBookHome(
      logo: Container(
        child: Text(
          'Storybook',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      listThemeData: [
        {'Theme': ThemeData()},
        {'Theme dark': ThemeData.dark()}
      ],
      listStoryBookModel: [
        storyCardSucess(),
        storyCarError(),
        storyButtonWin(),
        storyButtonFile()
      ]));
}
