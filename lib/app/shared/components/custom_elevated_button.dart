import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ussed_manager/app/shared/components/custom_text.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.width,
    this.height,
    this.textStyle,
    this.borderRadius,
  });
  final String text;
  final void Function() onPressed;
  final Color? backgroundColor;
  final double? width, height;
  final TextStyle? textStyle;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.h ?? Get.width.h / 2.5.h,
      height: height?.h ?? 60.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: .5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? 8,
            ),
          ),
          backgroundColor: backgroundColor ?? Colors.grey.shade100,
        ),
        onPressed: onPressed,
        child: CustomText(
          text: text,
          style: textStyle ?? GoogleFonts.poppins(color: Colors.black),
        ),
      ),
    );
  }
}
