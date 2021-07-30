import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:storybook/src/components/menu/drawe_list_tile.dart';
import 'package:storybook/src/routes/constants_routes.dart';

import '../../../storybook.dart';

class GetClickedView extends StatelessWidget {
  final StoryBookModel value;
  final Function(StoryBookModel) onItemClick;
  final EdgeInsets padding;

  GetClickedView(this.value, this.onItemClick, this.padding);

  @override
  Widget build(BuildContext context) {
    return DrawerListTile(
      title: value.subStoryDescription ?? value.storyDescription,
      padding: padding,
      seleted: ConstantsRoutes.getCurrentRoute(value),
      svgSrc: value.iconData,
      press: () {
        pushToRoute(value, ConstantsRoutes.getRouteByTitleAndDescription(value),
            onItemClick);
      },
    );
  }

  void pushToRoute(StoryBookModel storyBookModel, String route,
      Function(StoryBookModel) onItemClick) {
    if (!Modular.to.modulePath.contains(route)) {
      Modular.to.pushReplacementNamed(route);
      onItemClick(storyBookModel);
    }
  }
}
