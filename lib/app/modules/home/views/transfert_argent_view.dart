import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ussed_manager/app/modules/home/controllers/contacts_controller.dart';
import 'package:ussed_manager/app/modules/home/controllers/transfert_argent_controller.dart';
import 'package:ussed_manager/app/modules/home/views/widget_functions/build_input_field.dart';

import 'package:ussed_manager/app/shared/components/custom_elevated_button.dart';
import 'package:ussed_manager/app/shared/components/custom_radio_button.dart';
import 'package:ussed_manager/app/shared/components/custom_text.dart';
//import 'package:ussed_manager/app/shared/components/custom_text_form_field.dart';
import 'package:ussed_manager/app/shared/functions/functions.dart';

import 'components/contact_tile.dart';

// ignore: must_be_immutable
class TransfertArgent extends StatelessWidget {
  TransfertArgent({super.key});
  // final HomeController _homeCtrl = Get.find();
  final TransfertArgentController _targentCtrl =
      Get.put(TransfertArgentController());
  final ContactsController _contactsController = Get.find();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    _contactsController.getContacts();
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Transfert d'argent",
                      style: GoogleFonts.poppins(fontSize: 32.h),
                    ),
                    Gap(40.h),
                    // demander le montant
                    BuildInputField(
                      controller: _targentCtrl.montantController,
                      fieldName: "Montant",
                      hintText: "Saisir le montant à transférer",
                    ),
                    Gap(24.h),
                    // demander le numéro du destinataire
                    BuildInputField(
                      fieldName: "Numéro du destinataire",
                      controller: _targentCtrl.numeroDestinataireController,
                      child: Obx(
                        () => CustomElevatedButton(
                          width: double.maxFinite,
                          text: _targentCtrl.numeroDestinataire.isEmpty
                              ? "Clique ici"
                              : _targentCtrl.numeroDestinataire.value,
                          onPressed: () {
                            _contactsController.getContacts();
                            _buildBottomSheetContact();
                          },
                        ),
                      ),
                    ),
                    Gap(24.h),
                    // avec ou sans frais
                    BuildInputField(
                      controller: _targentCtrl.fraisController,
                      fieldName: "Voulez-vous ajouté les frais?",
                      child: Obx(() => Row(
                            children: [
                              CustomRadioButton(
                                value: "oui",
                                groupValue: _targentCtrl.groupValueFrais.value,
                                onChanged: (value) {
                                  _targentCtrl.groupValueFrais.value = value!;
                                },
                                text: "Oui",
                              ),
                              Gap(16.h),
                              CustomRadioButton(
                                value: "non",
                                groupValue: _targentCtrl.groupValueFrais.value,
                                onChanged: (value) {
                                  _targentCtrl.groupValueFrais.value = value!;
                                },
                                text: "Non",
                              ),
                            ],
                          )),
                    ),
                    Gap(24.h),
                    // demander code
                    BuildInputField(
                        controller: _targentCtrl.codeController,
                        fieldName: "Saisir code",
                        hintText: "Saisir votre code",
                        obscureText: true,
                        validator: (value) => Functions.validateCode(value)),
                    Gap(30.h),
                    CustomElevatedButton(
                      backgroundColor: Colors.grey.shade400,
                      textStyle: GoogleFonts.poppins(
                          fontSize: 18.h,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      text: "Valider",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _targentCtrl.validerTmoney();
                        }
                      },
                      width: double.maxFinite,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildBottomSheetContact() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.h),
          topRight: Radius.circular(30.h),
        ),
      ),
      backgroundColor: Colors.white,
      context: Get.overlayContext!,
      builder: (context) {
        return Container(
          width: double.maxFinite,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Choisir un contact",
                  style: GoogleFonts.poppins(
                    fontSize: 22.h,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(20.h),
                Expanded(
                    child: ListView.builder(
                  itemCount: _contactsController.contacts!.length,
                  itemBuilder: (context, index) {
                    final Contact? contact =
                        _contactsController.contacts![index];
                    final number = (contact!.phones.isNotEmpty)
                        ? contact.phones.first.number
                        : "Non spécifié";
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.h),
                      child: ContactTile(
                        onTap: () {
                          _targentCtrl.numeroDestinataire.value = number;
                          Get.back();
                        },
                        tileColor: Colors.white,
                        name: contact.displayName,
                        number: number,
                      ),
                    );
                  },
                ))
              ],
            ),
          ),
        );
      },
    );
  }
}
