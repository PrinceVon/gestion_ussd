import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ussed_manager/app/modules/home/controllers/solde_controller.dart';
import 'package:ussed_manager/app/modules/home/views/widget_functions/build_input_field.dart';
import 'package:ussed_manager/app/shared/components/custom_elevated_button.dart';
import 'package:ussed_manager/app/shared/components/custom_text.dart';
import 'package:ussed_manager/app/shared/functions/functions.dart';

class SoldeView extends GetView {
  SoldeView({super.key});
  final SoldeController _soldeController = Get.put(SoldeController());
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade200,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Checker votre solde Mixx",
                  style: GoogleFonts.poppins(
                      fontSize: 32.h, fontWeight: FontWeight.w600),
                ),
                Gap(60.h),
                BuildInputField(
                  controller: _soldeController.codeController,
                  fieldName: "Code *",
                  validator: (code) => Functions.validateCode(code),
                  obscureText: true,
                ),
                Gap(60.h),
                CustomElevatedButton(
                  backgroundColor: Colors.black,
                  textStyle: GoogleFonts.poppins(
                      color: Colors.grey.shade50, fontSize: 20.h),
                  width: double.maxFinite,
                  text: "Checker",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _soldeController.checkSolde();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
