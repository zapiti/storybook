import 'package:flutter/material.dart';

class CardError extends StatelessWidget {
  String error;
  bool disable;

  CardError({Key? key, required this.error,required this.disable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      color: disable ?Colors.black :Colors.red,
      child: Card(
          child: Container(padding: EdgeInsets.all(20), child: Text(error))),
    );
  }
}
