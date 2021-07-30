import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile(
      {required this.title,
      required this.svgSrc,
      required this.press,
      required this.seleted,
      required this.padding});

  final bool seleted;
  final String title;
  final IconData? svgSrc;
  final EdgeInsets padding;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
          onTap: press,
          selectedTileColor: Theme.of(context).primaryColor,
          selected: seleted,
          horizontalTitleGap: 0.0,
          leading: svgSrc == null
              ? null
              : Icon(
                  svgSrc,
                  color:
                      seleted ? Colors.white : Theme.of(context).primaryColor,
                ),
          title: Padding(
            padding: padding,
            child: Text(
            title,
            style: TextStyle(color: seleted ? Colors.white : null),
          ),
        ));
  }
}
