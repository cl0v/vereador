import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:get/get.dart';
import 'package:presidente/app/data/model/process_model.dart';
import 'package:presidente/app/data/model/vereador_model.dart';
import 'package:presidente/app/data/repository/process_repository.dart';

class HomeController extends GetxController {
  VereadorModel vereadorModel;
  List<ProcessModel> processlist;

  final streamProcessos = Rx<List<ProcessModel>>();

  final ProcessRepository processRepository;

  HomeController({@required this.processRepository});

  @override
  void onInit() {
    super.onInit();
    fetchVereadorInfo();
    fetchProcesses();
  }

  // @override
  // void onReady() {}

  // @override
  // void onClose() {}

  void fetchVereadorInfo() {
    vereadorModel = Get.arguments['vereadorModel'];
  }

  Future<void> fetchProcesses() async {
    streamProcessos.bindStream(await processRepository.getAll());
    // processos.bindStream(await processRepository.getAll());
  }

  void onAddPressed() {
    var processModel = ProcessModel(
      category: Category.saude,
      status: Status.open,
      title: 'nao faco ideia',
      subtitle: 'menos ainda',
      vereadorLack: 10,
    );
    processRepository.add(processModel);
    //TODO: Implement onAddPressed
  }

  void onRemovePressed() {
    //TODO: Implement onRemovePressed
  }

  void onEditPressed() {
    //TODO: Implement onEditPressed
  }
}

List<ProcessModel> processos = [
  ProcessModel(
    status: Status.inProgress,
    title: 'Lei n1654654-56',
    subtitle: 'Verba para hospital',
    vereadorLack: 2,
  ),
  ProcessModel(
    status: Status.inProgress,
    title: 'Lei n1654654-56',
    subtitle: 'Verba para hospital',
    vereadorLack: 2,
  ),
  ProcessModel(
    status: Status.inProgress,
    title: 'Lei n1654654-56',
    subtitle: 'Verba para hospital',
    vereadorLack: 2,
  ),
];
