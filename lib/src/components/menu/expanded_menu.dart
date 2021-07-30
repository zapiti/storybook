import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import '../../../storybook.dart';
import 'expaded_header.dart';
import 'get_clicked_view.dart';

class ExpandedMenu extends StatefulWidget {
  final MapEntry<String, List<StoryBookModel>> values;
  final Function(StoryBookModel) onItemClick;

  ExpandedMenu(this.values, this.onItemClick);

  @override
  _ExpandedMenuState createState() => _ExpandedMenuState();
}

class _ExpandedMenuState extends State<ExpandedMenu> {
  bool open = false;
  bool open2 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      ExpandedHeader(widget.values.key, true, () {
        setState(() {
          open = !open;
        });
      }),
      ...!open
          ? []
          : groupBy(widget.values.value,
                  (obj) => (obj as StoryBookModel).storyDescription)
              .map((index, value) => MapEntry(
                  index,
                  value.length > 1
                      ? Column(children: [
                          ExpandedHeader(value.first.storyDescription, false,
                              () {
                            setState(() {
                              open2 = !open2;
                            });
                          }),
                          ...!open2
                              ? []
                              : value.map((e) => GetClickedView(
                                  e,
                                  widget.onItemClick,
                                  EdgeInsets.symmetric(horizontal: 16)))
                        ])
                      : GetClickedView(
                          value.first, widget.onItemClick, EdgeInsets.zero)))
              .values
              .toList()
    ]));
  }
}
