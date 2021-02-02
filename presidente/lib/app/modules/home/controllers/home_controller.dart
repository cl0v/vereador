import 'package:get/get.dart';
import 'package:presidente/app/data/model/vereador_model.dart';

class HomeController extends GetxController {

VereadorModel vereadorModel;

  @override
  void onInit() {
    super.onInit();
    vereadorModel = Get.arguments['vereadorModel'];
  }

  // @override
  // void onReady() {}

  // @override
  // void onClose() {}
}
