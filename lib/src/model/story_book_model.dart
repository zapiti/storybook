import 'package:flutter/cupertino.dart';

class StoryBookModel {
  String storyTitle;
  String storyDescription;
  Widget story;
  String? storyCode;
  List<String>? storyImports;
  IconData? iconData;

  StoryBookModel(
      {required this.storyTitle,
      required this.storyDescription,
      required this.story,
        this.iconData,
      this.storyCode,
      this.storyImports});
}
