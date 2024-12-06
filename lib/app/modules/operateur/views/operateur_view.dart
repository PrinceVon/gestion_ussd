import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ussed_manager/app/routes/app_pages.dart';
import 'package:ussed_manager/app/shared/components/custom_elevated_button.dart';
import 'package:ussed_manager/app/shared/components/custom_text.dart';

import '../controllers/operateur_controller.dart';

class OperateurView extends GetView<OperateurController> {
  const OperateurView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "Choisir votre opérateur",
                  style: GoogleFonts.poppins(
                    fontSize: 32.h,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade500,
                  ),
                ),
                Gap(40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomElevatedButton(
                      backgroundColor: Colors.grey.shade300,
                      text: "Yas",
                      onPressed: () => Get.toNamed(AppPages.HOME),
                    ),
                    Gap(12.h),
                    CustomElevatedButton(
                      backgroundColor: Colors.grey.shade300,
                      text: "Moov Africa",
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
