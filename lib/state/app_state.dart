import 'package:flutter/foundation.dart';

class AppState {
  static final ValueNotifier<bool> isArabic = ValueNotifier<bool>(false);

  static String tr(String en, String ar) => isArabic.value ? ar : en;
}
