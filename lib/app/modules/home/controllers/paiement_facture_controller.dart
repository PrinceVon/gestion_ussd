import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ussed_manager/app/modules/home/models/type_facture.dart';

class PaiementFactureController extends GetxController {
  RxList<TypeFacture> typeFactures = <TypeFacture>[].obs;
  RxBool isExpanded = false.obs;

  @override
  void onReady() {
    super.onReady();
    typeFactures.assignAll([
      TypeFacture(
          title: "Électricité",
          iconData: Icons.electric_bolt_outlined,
          subOptions: ["CEET FACTURE", "CEET CASH POWER"]),
      TypeFacture(
          title: "Eau",
          iconData: Icons.water,
          subOptions: ["TDE PREPAYE", "TDE FACTURE"]),
      TypeFacture(
          title: "Chaîne TV",
          iconData: Icons.tv,
          subOptions: ["CANAL +", "NEW WORLD TV"]),
      TypeFacture(
          title: "Télécoms",
          iconData: Icons.wifi,
          subOptions: ["FIBRE TOGOCOM", "CANALBOX"]),
      TypeFacture(
          title: "Écoles / Universités",
          iconData: Icons.school,
          subOptions: ["UNIVERSITÉ DE LOMÉ", "UNIVERSITÉ DE KARA"]),
    ]);
  }
}
