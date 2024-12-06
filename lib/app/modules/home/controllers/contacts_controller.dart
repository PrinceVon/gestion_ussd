import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';

class ContactsController extends GetxController {
  RxList<Contact>? contacts = RxList<Contact>();
  RxBool isLoading = false.obs;

  @override
  void onReady() async {
    super.onReady();
    getContacts();
  }

  void getContacts() async {
    isLoading.value = true;
    final result = await requestContactsPermission();

    if (result) {
      contacts?.value = await FlutterContacts.getContacts(
        withAccounts: true,
        sorted: true,
        withPhoto: true,
        withThumbnail: true,
        withProperties: true,
      );
    }
    isLoading.value = false;
  }


  // Liste filtrée pour la recherche
  final RxList<Contact> filteredContacts = RxList<Contact>();

  // Texte de recherche
  final searchQuery = ''.obs;

  Future<bool> requestContactsPermission() async {
    return await FlutterContacts.requestPermission();
  }

  void filterContacts(String query) {
    if (query.isEmpty) {
      filteredContacts.assignAll(contacts!);
    } else {
      filteredContacts.assignAll(
        contacts!.where((contact) =>
            contact.displayName.toLowerCase().contains(query.toLowerCase()) ||
            contact.phones.contains(query)),
      );
    }
  }
}
