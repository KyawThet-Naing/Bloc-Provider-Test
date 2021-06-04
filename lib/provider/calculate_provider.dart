import 'package:flutter/foundation.dart';

class CalculateProvider extends ChangeNotifier {
  int ans = 0;

  sub({required int num1, required int num2}) {
    ans = num1 - num2;
    notifyListeners();
  }

  sum({required int num1, required int num2}) {
    ans = num1 + num2;
    notifyListeners();
  }
}
