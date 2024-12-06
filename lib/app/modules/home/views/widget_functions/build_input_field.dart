import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ussed_manager/app/shared/components/custom_text.dart';
import 'package:ussed_manager/app/shared/components/custom_text_form_field.dart';
import 'package:ussed_manager/app/shared/functions/functions.dart';

Widget BuildInputField(
    {required String fieldName,
    String? hintText,
    Widget? child,
    bool? enabled,
    bool? obscureText,
    TextEditingController? controller,
    String? Function(String?)? validator,
    Function()? onTap}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomText(
        text: fieldName,
        style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 18.h),
      ),
      Gap(12.h),
      child ??
          CustomTextFormField(
            validator: validator ?? (value) => Functions.validateField(value),
            controller: controller,
            onTap: onTap,
            enabled: enabled,
            hintText: hintText,
            obscureText: obscureText,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
    ],
  );
}
