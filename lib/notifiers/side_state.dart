import 'package:flutter/cupertino.dart';

class SideState extends ChangeNotifier {
  bool _isScale = false;

  bool get isScale => _isScale;

  set isScale(bool value) {
    _isScale = value;
    notifyListeners();
  }
}
