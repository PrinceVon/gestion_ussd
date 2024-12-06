import 'package:get/get.dart';

import '../controllers/operateur_controller.dart';

class OperateurBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OperateurController>(
      () => OperateurController(),
    );
  }
}
