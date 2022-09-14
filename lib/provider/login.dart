import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  String? selectedValue  = "Cable";

  void onChanged(String? value) {
    selectedValue = value;
    notifyListeners();
  }
}

