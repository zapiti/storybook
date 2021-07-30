import 'package:flutter/cupertino.dart';
import 'package:storybook/src/components/code_pad/code_pad.dart';
import 'package:storybook/src/model/story_action_model.dart';
import 'package:storybook/src/model/story_element_model.dart';

class StoryBookModel {
  String storyTitle;
  String storyDescription;
  String? subStoryDescription;
  StoryElementModel story;
  List<StoryActionModel>? storyActions;
  final String sourceStoryFilePath;

  final SyntaxHighlighterStyle? syntaxHighlighterStyle;

  IconData? iconData;

  StoryBookModel({
    required this.storyTitle,
    required this.storyDescription,
    required this.story,
    this.storyActions,
    this.subStoryDescription,
    this.iconData,    required this.sourceStoryFilePath,
    this.syntaxHighlighterStyle,
  });
}
