import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ussed_manager/app/modules/home/controllers/contacts_controller.dart';
import 'package:ussed_manager/app/modules/home/views/components/contact_list_view.dart';
import 'package:ussed_manager/app/modules/home/views/components/view_title.dart';
import 'package:ussed_manager/app/shared/components/custom_text.dart';
import 'package:ussed_manager/app/shared/components/custom_text_form_field.dart';

class ContactsTab extends GetView {
  ContactsTab({super.key});
  final ContactsController _contactController = Get.put(ContactsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Obx(() {
          return Column(
            children: [
              ViewTitle(
                viewTitle: "Contacts List",
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                ),
                height: 60.h,
                child: _buildSearchBox(),
              ),
              Gap(20.h),
              Expanded(
                child:
                    _contactList(contacts: _contactController.filteredContacts),
              )
            ],
          );
        }),
      ),
    );
  }

  Widget _buildSearchBox() {
    return CustomTextFormField(
      onChanged: (value) {
        printInfo(info: value);
        _contactController.filterContacts(value);
      },
      hintText: "Rechercher",
      keyboardType: TextInputType.emailAddress,
      suffixIcon: Icon(
        Icons.search,
        color: Colors.grey.shade500,
      ),
    );
  }

  Widget _contactList({required RxList<Contact>? contacts}) {
    return ContactListView(
      contacts: contacts,
    );
  }

  Widget _displayContactButton(ContactsController _contactController) {
    return Obx(
      () {
        if (_contactController.isLoading.value) {
          return CircularProgressIndicator(
            color: Colors.grey.shade600,
          );
        }
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.h),
            ),
            side: BorderSide(width: 2.h, color: Colors.grey.shade400),
          ),
          onPressed: () {
            _contactController.getContacts();
          },
          child: CustomText(
            text: "Afficher liste des contacts",
            style: GoogleFonts.poppins(fontSize: 18.h, color: Colors.black),
          ),
        );
      },
    );
  }
}
