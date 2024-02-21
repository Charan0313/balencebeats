import 'package:get/get.dart';

class SelectionController extends GetxController {
  var selectedText = ''.obs;

  void setSelectedText(String text) {
    selectedText.value = text;
  }
}
