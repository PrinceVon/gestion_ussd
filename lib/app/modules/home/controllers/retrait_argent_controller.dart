import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ussed_manager/app/shared/functions/functions.dart';

class RetraitArgentController extends GetxController {
  TextEditingController montantController = TextEditingController();
  TextEditingController numeroAgentController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  void valider() {
    final query =
        "*145*2*${montantController.text}*${numeroAgentController.text}*${codeController.text}#";
    Functions.makeDirectCall(query);
    clearFields();
  }

  void clearFields() {
    montantController.clear();
    numeroAgentController.clear();
    codeController.clear();
  }
}
