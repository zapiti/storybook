import 'package:flutter/material.dart';

class ButtonWin extends StatelessWidget {
  final String msg;
  final bool enable;

  ButtonWin({Key? key, required this.msg, required this.enable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      child: ElevatedButton(
          onPressed: enable ? () {} : null,
          style: ElevatedButton.styleFrom(
              primary: Theme.of(context).backgroundColor),
          child: Text(
            msg,
            style: TextStyle(color: Colors.black),
          )),
    );
  }
}
