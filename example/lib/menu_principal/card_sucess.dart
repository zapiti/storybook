import 'package:flutter/material.dart';

class CardSucess extends StatelessWidget {
  String msg;
  String? update;

  CardSucess({Key? key, required this.msg,required this.update}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.all(10),
      color: Theme.of(context).primaryColor,
      child:
          Card(child: Container(padding: EdgeInsets.all(20), child: Text(update ?? msg))),
    );
  }
}
