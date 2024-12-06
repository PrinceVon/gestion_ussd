import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ussed_manager/app/shared/functions/functions.dart';

class SoldeController extends GetxController {
  TextEditingController codeController = TextEditingController();

  void checkSolde() {
    String call = "*145*7*1*${codeController.text}#";

    Functions.makeDirectCall(call);
  }
}
