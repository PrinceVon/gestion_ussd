import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CustomRadioButton extends StatelessWidget {
  final String value;
  final String groupValue;
  final Function(String?) onChanged;
  final String text;

  const CustomRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        children: [
          Container(
            width: 24.h, // Taille du bouton radio
            height: 24.h, // Taille du bouton radio
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: groupValue == value
                    ? Colors.green.shade600
                    : Colors.grey, // Couleur selon la sélection
                width: 2,
              ),
            ),
            child: groupValue == value
                ? Center(
                    child: Container(
                      width: 16.h,
                      height: 16.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            Colors.green.shade600, // Couleur du point intérieur
                      ),
                    ),
                  )
                : null,
          ),
          Gap(8.h), // Espacement entre le bouton et le texte
          Text(
            text,
            style: Get.textTheme.titleMedium!.copyWith(fontSize: 16.h),
          ),
        ],
      ),
    );
  }
}
