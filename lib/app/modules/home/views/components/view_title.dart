import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ussed_manager/app/shared/components/custom_text.dart';

class ViewTitle extends StatelessWidget {
  const ViewTitle({
    super.key,
    required this.viewTitle,
  });
  final String viewTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 16.h),
      child: SizedBox(
        width: double.maxFinite,
        child: CustomText(
          text: viewTitle,
          style: GoogleFonts.poppins(
            fontSize: 24.h,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
