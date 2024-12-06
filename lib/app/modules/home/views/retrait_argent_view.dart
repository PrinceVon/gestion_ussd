import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ussed_manager/app/modules/home/controllers/retrait_argent_controller.dart';
import 'package:ussed_manager/app/modules/home/views/widget_functions/build_input_field.dart';
import 'package:ussed_manager/app/shared/components/custom_elevated_button.dart';
import 'package:ussed_manager/app/shared/components/custom_text.dart';
import 'package:ussed_manager/app/shared/functions/functions.dart';

class RetraitArgentView extends GetView {
  RetraitArgentView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RetraitArgentController _retraitArgentController =
      Get.put(RetraitArgentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Retrait d'argent",
                    style: GoogleFonts.poppins(
                        fontSize: 32.h, fontWeight: FontWeight.w600),
                  ),
                  Gap(40.h),
                  BuildInputField(
                      controller: _retraitArgentController.montantController,
                      fieldName: "Montant",
                      hintText: "Entrez le montant de retrait",
                      validator: (value) => Functions.validateField(value)),
                  Gap(20.h),
                  BuildInputField(
                      controller:
                          _retraitArgentController.numeroAgentController,
                      fieldName: "Numéro de l'agent",
                      hintText: "Entrez le numéro de l'agent",
                      validator: (value) => Functions.validateField(value)),
                  Gap(20.h),
                  BuildInputField(
                    controller: _retraitArgentController.codeController,
                    fieldName: "Code",
                    hintText: "Entrez votre code MIXX",
                    validator: (value) => Functions.validateCode(value),
                    obscureText: true,
                  ),
                  Gap(40.h),
                  CustomElevatedButton(
                    text: "Valider",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _retraitArgentController.valider();
                      }
                    },
                    width: double.maxFinite,
                    backgroundColor: Colors.black,
                    textStyle: GoogleFonts.poppins(
                        color: Colors.grey.shade50, fontSize: 20.h),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
