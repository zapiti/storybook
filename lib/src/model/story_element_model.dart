


import 'package:flutter/cupertino.dart';
import 'package:storybook/src/model/story_action_model.dart';

class StoryElementModel {
  Widget Function(List<StoryActionModel>? actions) builder;

  StoryElementModel({required this.builder});
}