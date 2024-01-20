import 'package:balencebeats/data/introduction_description.dart';
import 'package:get/get.dart';

class IntroductionController extends GetxController {
  final RxInt id = 0.obs;
  final RxString description = descriptionStrings[0].obs;
}
