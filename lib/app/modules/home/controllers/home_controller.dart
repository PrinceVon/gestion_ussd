import 'package:flutter/material.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:ussed_manager/app/data/models/operation_model.dart';
import 'package:ussed_manager/app/modules/home/views/paiement_facture_view.dart';
import 'package:ussed_manager/app/modules/home/views/retrait_argent_view.dart';
import 'package:ussed_manager/app/modules/home/views/solde_view.dart';
import 'package:ussed_manager/app/modules/home/views/tabs/contacts_tab.dart';
import 'package:ussed_manager/app/modules/home/views/tabs/operations_tab.dart';
import 'package:ussed_manager/app/modules/home/views/transfert_argent_view.dart';

class HomeController extends GetxController {
  List<OperationModel> operations = <OperationModel>[];
  final RxInt tabIndex = 0.obs;

  List<Widget> gTabs = <Widget>[
    OperationsTab(),
    ContactsTab(),
  ];

  void changeTab(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    printInfo(info: tabIndex.toString());
    super.onInit();
    operations = [
      OperationModel(
          operationName: "Transfert d'argent", operation: transfertArgent),
      OperationModel(
          operationName: "Retrait d'argent", operation: retraitArgent),
      OperationModel(operationName: "Crédit / Forfait", operation: () {}),
      OperationModel(
          operationName: "Paiement de facture", operation: paiementFacture),
      OperationModel(operationName: "Paiement marchand", operation: () {}),
      OperationModel(operationName: "Service financiers", operation: () {}),
      OperationModel(operationName: "Mon Compte", operation: () {}),
      OperationModel(operationName: "Solde", operation: checkSolde),
    ];
  }

  // _callNumber() async {
  //   const number = '70394066'; //set the number here
  //   bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  // }

  void retraitArgent() {
    Get.to(() => RetraitArgentView());
  }

  void transfertArgent() {
    // afficher un page qui demande les trucs suivant
    Get.to(() => TransfertArgent());

    // _callNumber();
  }

  void checkSolde() {
    Get.to(() => SoldeView());
  }

  void paiementFacture() {
    Get.to(() => PaiementFactureView());
  }
}
