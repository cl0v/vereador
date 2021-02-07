import 'package:get/get.dart';

import 'package:presidente/app/modules/add_process/controllers/add_process_controller.dart';

class AddProcessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddProcessController>(
      () => AddProcessController(),
    );
  }
}
