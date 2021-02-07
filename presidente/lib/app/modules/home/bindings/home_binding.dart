import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:presidente/app/data/provider/process_provider.dart';
import 'package:presidente/app/data/repository/process_repository.dart';
import 'package:presidente/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(
        processRepository: ProcessRepository(
          provider: ProcessProvider(
            firestore: FirebaseFirestore.instance,
          ),
        ),
      ),
    );
  }
}
