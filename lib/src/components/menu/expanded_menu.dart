import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:storybook/src/routes/constants_routes.dart';
import '../../../storybook.dart';
import 'drawe_list_tile.dart';

class ExpandedMenu extends StatefulWidget {
  final MapEntry<String, List<StoryBookModel>> values;
  final Function(StoryBookModel) onItemClick;

  ExpandedMenu(this.values, this.onItemClick);

  @override
  _ExpandedMenuState createState() => _ExpandedMenuState();
}

class _ExpandedMenuState extends State<ExpandedMenu> {
  bool open = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      ListTile(
        onTap: () {
          setState(() {
            open = !open;
          });
        },
        selectedTileColor: Theme.of(context).primaryColor,
        horizontalTitleGap: 0.0,
        trailing: Icon(
          Icons.keyboard_arrow_down_sharp,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          widget.values.key,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      ...!open
          ? []
          : widget.values.value
              .map((e) => DrawerListTile(
                    title: e.storyDescription,
                    seleted: ConstantsRoutes.getCurrentRoute(
                        e.storyTitle, e.storyDescription),
                    svgSrc: e.iconData,
                    press: () {
                      pushToRoute(
                          e,
                          ConstantsRoutes.getRouteByTitleAndDescription(
                              e.storyTitle, e.storyDescription),
                          widget.onItemClick);
                    },
                  ))
              .toList()
    ]));
  }
}

void pushToRoute(StoryBookModel storyBookModel, String route,
    Function(StoryBookModel) onItemClick) {
  if (!Modular.to.modulePath.contains(route)) {
    Modular.to.pushReplacementNamed(route);
    onItemClick(storyBookModel);
  }
}
