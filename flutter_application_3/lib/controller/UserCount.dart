import 'package:flutter/foundation.dart';

class UserCounterProvider extends ChangeNotifier {
  int _userCount = 0;

  int get userCount => _userCount;

  void incrementUserCount() {
    _userCount++;
    notifyListeners();
  }

  void decrementUserCount() {
    if (_userCount > 0) {
      _userCount--;
      notifyListeners();
    }
  }
}
