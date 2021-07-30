import 'package:flutter/material.dart';

class ExpandedHeader extends StatelessWidget {
  final String title;
  final bool isMain;
  final Function() onOpen;

  ExpandedHeader(this.title, this.isMain, this.onOpen);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onOpen,
      selectedTileColor: Theme.of(context).primaryColor,
      horizontalTitleGap: 0.0,
      leading: Icon(Icons.folder_open,color: isMain ? Theme.of(context).primaryColor : Colors.black,size: 18,),
      trailing: Icon(
        Icons.keyboard_arrow_down_sharp,
        color: isMain ? Theme.of(context).primaryColor : Colors.black,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: isMain ? Theme.of(context).primaryColor : Colors.black),
      ),
    );
  }
}
