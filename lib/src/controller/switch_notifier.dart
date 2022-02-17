import 'package:flutter/foundation.dart';

class SwitchNotifier extends ValueNotifier<int> {
  SwitchNotifier({int newValue = 0}) : super(newValue);

  void change(int newIndex) {
    value = newIndex;
  }
}
