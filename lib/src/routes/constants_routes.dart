import 'package:flutter_modular/flutter_modular.dart';
import 'package:storybook/src/model/story_book_model.dart';

class ConstantsRoutes {
  static String getRouteByTitleAndDescription(StoryBookModel storyBookModel) {
    if (storyBookModel.subStoryDescription == null) {
      final route =
          (storyBookModel.storyTitle + "_" + storyBookModel.storyDescription)
              .replaceAll(" ", "_")
              .replaceAll("-", "_")
              .toLowerCase();
      return route;
    } else {
      final route = (storyBookModel.storyTitle +
              "_" +
              storyBookModel.storyDescription +
              "_" +
              storyBookModel.subStoryDescription!)
          .replaceAll(" ", "_")
          .replaceAll("-", "_")
          .toLowerCase();

      return route;
    }
  }

  static getCurrentRoute(StoryBookModel storyBookModel) {
    String currentRoute = Modular.to.localPath;

    if (currentRoute.contains(getRouteByTitleAndDescription(storyBookModel))) {
      return true;
    }

    return false;
  }

  static String getCurrentTitle(StoryBookModel? storyBookModel) {
    if (storyBookModel != null) {
      return ((storyBookModel.subStoryDescription ??
              storyBookModel.storyDescription))
          .capitalize();
    } else {
      return "Home";
    }
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
