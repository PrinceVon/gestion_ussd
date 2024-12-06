// import 'package:fast_contacts/fast_contacts.dart';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ussed_manager/app/modules/home/controllers/transfert_argent_controller.dart';
import 'package:ussed_manager/app/modules/home/views/components/contact_tile.dart';

class ContactListView extends StatelessWidget {
  ContactListView(
      {super.key, required this.contacts, this.tileColor, this.dismiss});
  final RxList<Contact>? contacts;
  final Color? tileColor;
  final bool? dismiss;
  final TransfertArgentController _targentCtrl =
      Get.put(TransfertArgentController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts!.length,
      itemBuilder: (context, index) {
        final Contact? contact = contacts![index];
        final number = (contact!.phones.isNotEmpty)
            ? contact.phones.last.number
            : "Non spécifié";
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.h),
          child: ContactTile(
            onTap: () {
              _targentCtrl.numeroDestinataireController.text = number;
              dismiss ?? false ? Get.back() : null;
            },
            tileColor: tileColor,
            name: contact.displayName,
            number: number,
          ),
        );
      },
    );
  }
}
