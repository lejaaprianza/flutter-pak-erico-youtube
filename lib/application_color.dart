import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ApplicationColor with ChangeNotifier {
  bool _isLightBlue = true;

  bool get islightBlue => _isLightBlue;

  set isLightBlue(bool value) {
    _isLightBlue = value;
    notifyListeners();
  }

  Color get color => (_isLightBlue) ? Colors.lightBlue : Colors.amber;
}
