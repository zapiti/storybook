import 'package:flutter/material.dart';

class DropdownTheme extends StatefulWidget {
  DropdownTheme(
      {Key? key,
      required this.callback,
      required this.lisTheme,
      required this.selected})
      : super(key: key);
  final List<Map<String, ThemeData>> lisTheme;
  final Function(Map<String, ThemeData>) callback;
  final Map<String, ThemeData> selected;

  @override
  _DropdownThemeState createState() => _DropdownThemeState();
}

class _DropdownThemeState extends State<DropdownTheme> {
  @override
  Widget build(BuildContext context) {
    return widget.lisTheme.isEmpty
        ? SizedBox()
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),

            // dropdown below..
            child: DropdownButton<String>(
              value: widget.selected.keys.first,
              hint: Text("Theme"),
              iconSize: 24,
              elevation: 16,
              icon: Icon(Icons.arrow_drop_down,
                  color: Theme.of(context).primaryColor),
              underline: SizedBox(),
              onChanged: (selected) {
                if (selected != null)
                  widget.callback.call(widget.lisTheme
                      .firstWhere((element) => selected == element.keys.first));
              },
              items: widget.lisTheme
                  .map<DropdownMenuItem<String>>((themeSelected) =>
                      DropdownMenuItem<String>(
                        value: themeSelected.keys.first,
                        child: Text(
                          themeSelected.keys.first,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ))
                  .toList(),
            ));
  }
}
