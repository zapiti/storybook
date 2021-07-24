import 'package:flutter/cupertino.dart';

class Utils {
  static isSmalSize(BoxConstraints constraints) {
    return constraints.maxWidth >= 800;
  }
}
