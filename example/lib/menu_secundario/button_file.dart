import 'package:flutter/material.dart';

class ButtonFile extends StatelessWidget {
  String text;

  ButtonFile({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,width: 200,
      child:  ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor),
              onPressed: () {},
              child: Text(text)),
    );
  }
}
