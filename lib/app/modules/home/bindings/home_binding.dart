import 'package:get/get.dart';

import 'package:ussed_manager/app/modules/home/controllers/contacts_controller.dart';
import 'package:ussed_manager/app/modules/home/controllers/paiement_facture_controller.dart';
import 'package:ussed_manager/app/modules/home/controllers/retrait_argent_controller.dart';
import 'package:ussed_manager/app/modules/home/controllers/solde_controller.dart';
//import 'package:ussed_manager/app/modules/home/views/transfert_argent_view.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RetraitArgentController>(
      () => RetraitArgentController(),
    );
    Get.lazyPut<PaiementFactureController>(
      () => PaiementFactureController(),
    );
    Get.lazyPut<SoldeController>(
      () => SoldeController(),
    );

    Get.lazyPut<ContactsController>(
      () => ContactsController(),
    );
    Get.lazyPut<ContactsController>(
      () => ContactsController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
