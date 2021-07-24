import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:storybook/src/model/story_book_model.dart';
import 'package:storybook/src/routes/constants_routes.dart';
import "package:collection/collection.dart";

import 'expanded_menu.dart';

class MenuWidget extends StatelessWidget {
  final Function(StoryBookModel) onItemClick;
  final List<StoryBookModel> listStoryBookModel;
  final Function(String) searchMenu;

  const MenuWidget(
      {Key? key,
      required this.onItemClick,
      required this.listStoryBookModel,
      required this.searchMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 228,
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Drawer(
              child: ListView(children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: TextField(
                      onChanged: searchMenu,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          labelText: "Search",
                          fillColor: Colors.white70)),
                ),
                ...groupBy(listStoryBookModel,
                        (obj) => (obj as StoryBookModel).storyTitle)
                    .entries
                    .map<Widget>((e) => ExpandedMenu(e, onItemClick))
                    .toList()
              ]),
            )));
  }
}
