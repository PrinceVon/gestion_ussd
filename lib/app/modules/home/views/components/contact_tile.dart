// import 'package:fast_contacts/fast_contacts.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ussed_manager/app/shared/components/custom_text.dart';
import 'package:ussed_manager/app/shared/functions/functions.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({
    super.key,
    required this.name,
    required this.number, this.tileColor, this.onTap,
  });
  final Color? tileColor;
  final String name, number;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: tileColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.h)),
      leading: Container(
        alignment: Alignment.center,
        height: 65.h,
        width: 65.h,
        decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(50.h),
        ),
        child: CustomText(
          text: Functions.getInitials(name),
          style: GoogleFonts.poppins(fontSize: 20.h, color: Colors.white),
        ),
      ),
      title: CustomText(
        text: name,
        style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18.h),
      ),
      subtitle: CustomText(text: number),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 22.h,
      ),
    );
  }
}
