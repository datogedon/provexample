import 'package:flutter/foundation.dart';

class TextProvider with ChangeNotifier {
  String _text1 = "";
  String _text2 = "";

  String get text1 => _text1;
  String get text2 => _text2;

  Future<void> setTexts({required String value1}) async {
    _text1 = value1;
    notifyListeners();
  }
}
