import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ussed_manager/app/shared/functions/functions.dart';

class TransfertArgentController extends GetxController {
  final RxString groupValueFrais = "".obs;

  final TextEditingController montantController = TextEditingController();
  final TextEditingController numeroDestinataireController =
      TextEditingController();
  final TextEditingController fraisController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  final RxString montant = "".obs;
  final RxString numeroDestinataire = "".obs;
  final RxString frais = "".obs;
  final RxString code = "".obs;

  void validerTmoney() {
    String call =
        "*145*1*${montantController.text}*${Functions.formatPhoneNumber(numeroDestinataire.value)}*${fraisController.text == "oui" ? 1 : 2}*${codeController.text}#";
    Functions.makeDirectCall(call);
  }
}
