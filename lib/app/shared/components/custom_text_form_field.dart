import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.keyboardType,
    this.validator,
    this.enabled,
    this.onTap,
    this.suffixIcon,
    this.controller, this.obscureText,this.onChanged
  });

  final String? hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool? enabled;
  final void Function()? onTap;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool? obscureText;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: double.maxFinite,
        child: TextFormField(
          onChanged: onChanged,
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          enabled: enabled,
          cursorColor: Colors.grey.shade600,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: Colors.grey.shade300,
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
                fontSize: 16.h, color: Colors.grey.shade500),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              ),
              borderRadius: BorderRadius.circular(8.h),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade600,
                width: 2.h,
              ),
              borderRadius: BorderRadius.circular(8.h),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red.shade600,
                width: 2.h,
              ),
              borderRadius: BorderRadius.circular(8.h),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red.shade600,
                width: 2.h,
              ),
              borderRadius: BorderRadius.circular(8.h),
            ),
          ),
        ),
      ),
    );
  }
}
