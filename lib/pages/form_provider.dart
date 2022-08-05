import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class FromsProvider with ChangeNotifier {
  FromsProvider() {
    createControllerText();
  }
  List<TextEditingController> _controllers = <TextEditingController>[];

  List<TextEditingController> get controllers => _controllers;

  Future<void> createControllerText() async {
    _controllers.add(TextEditingController());
    notifyListeners();
  }

  Future<void> deleteControllerText({index}) async {
    _controllers.remove(index);
    notifyListeners();
  }
}
