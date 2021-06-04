import 'package:flutter/foundation.dart';

class CountProvider extends ChangeNotifier {
  int count = 0;

  increaseCount() {
    count++;
    notifyListeners();
  }

  decreaseCount() {
    count--;
    notifyListeners();
  }
}
