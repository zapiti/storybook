import 'package:flutter_modular/flutter_modular.dart';

class ConstantsRoutes {
  static String getRouteByTitleAndDescription(
      String title, String description) {
    return (title + "_" + description).replaceAll(" ", "_").toLowerCase();
  }

  static getCurrentRoute(String storyTitle, String storyDescription) {
    String currentRoute = Modular.to.localPath;

    if (currentRoute.contains(
        getRouteByTitleAndDescription(storyTitle, storyDescription))) {
      return true;
    }

    return false;
  }

  static String getCurrentTitle() {
    String currentRoute = Modular.to.localPath;
    if (currentRoute.contains("_")) {
      return currentRoute.split("_").first.capitalize();
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
