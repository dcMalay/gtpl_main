import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  var currentIndex = 0;
  void chnageScreen(int screen) {
    currentIndex = screen;
    notifyListeners();
  }
}
