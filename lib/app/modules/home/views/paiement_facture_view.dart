import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ussed_manager/app/modules/home/controllers/paiement_facture_controller.dart';
import 'package:ussed_manager/app/shared/components/custom_text.dart';

class PaiementFactureView extends GetView {
  PaiementFactureView({super.key});

  final PaiementFactureController _pfController =
      Get.put(PaiementFactureController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: Text("Paiement Facture",
            style: GoogleFonts.poppins(fontSize: 20.h)),
      ),
      body: Obx(
        () {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: ListView.separated(
              itemCount: _pfController.typeFactures.length,
              itemBuilder: (context, index) {
                final option = _pfController.typeFactures[index];
                return PaiementFactureAccordionTile(
                  option: option.title!,
                  leadingIcon: option.iconData!,
                  subOptions: option.subOptions,
                );
              },
              separatorBuilder: (context, index) => Gap(10),
            ),
          );
        },
      ),
    );
  }
}

class PaiementFactureAccordionTile extends StatelessWidget {
  const PaiementFactureAccordionTile({
    super.key,
    required this.option,
    required this.leadingIcon,
    required this.subOptions,
  });

  final String option;
  final IconData leadingIcon;
  final List<String> subOptions;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedBackgroundColor: Colors.grey.shade50,
      expansionAnimationStyle: AnimationStyle(
        reverseDuration: Duration(seconds: 3),
        duration: Duration(seconds: 5),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.h)),
      tilePadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 18.h),
      collapsedShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.h)),
      leading: IconBuilder(
        leadingIcon: leadingIcon,
      ),
      trailing: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: Colors.grey,
      ),
      title: CustomText(
        text: option,
        style: GoogleFonts.poppins(fontSize: 18.h),
      ),
      children: List.generate(
        subOptions.length,
        (index) {
          final subOption = subOptions[index];
          return _buildSuboptionsTile(subOption);
        },
      ),
    );
  }

  Container _buildSuboptionsTile(String subOption) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.h),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: ListTile(
        tileColor: Colors.grey.shade300,
        contentPadding: EdgeInsets.symmetric(horizontal: 18.h),
        title: Text(
          subOption,
          style:
              GoogleFonts.poppins(fontSize: 16.h, fontWeight: FontWeight.w600),
        ),
        onTap: () {
          showModalBottomSheet(
            backgroundColor: Colors.grey.shade100,
            context: Get.overlayContext!,
            builder: (context) {
              return Container();
            },
          );
        },
      ),
    );
  }
}

class IconBuilder extends StatelessWidget {
  const IconBuilder({
    super.key,
    required this.leadingIcon,
  });

  final IconData leadingIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Icon(
        leadingIcon,
        size: 34.h,
        color: Colors.grey,
      ),
    );
  }
}
