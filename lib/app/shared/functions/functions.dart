import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class Functions {
  Functions._();

  static String getInitials(String? name) {
    if (name == null || name.isEmpty)
      return ""; // Return empty string if null or empty
    List<String> parts = name.split(" ");
    String initials = "";
    for (var part in parts) {
      if (part.isNotEmpty) initials += part[0].toUpperCase();
    }
    return initials;
  }

  static String? validateField(String? value) {
    if (value!.isEmpty) {
      return "Veuillez remplir ce champ😔";
    } else {
      return null;
    }
  }

  static String? validateCode(String? value) {
    if (value!.length < 4) {
      return "Veuillez remplir ce champ😔";
    } else {
      return null;
    }
  }

  static String? isValidPhoneNumber(String? phoneNumber) {
    // Vérifie que la longueur est de 8 caractères
    if (phoneNumber!.length != 8) {
      return 'Numéro invalid 😔';
    }

    // Vérifie que le numéro commence par un préfixe valide
    const validPrefixes = ['70', '71', '90', '91', '92', '93'];
    String prefix = phoneNumber.substring(0, 2);

    if (!validPrefixes.contains(prefix)) {
      return "Numéro n'est pas Togocel 😂";
    }

    return null;
  }

  static String formatPhoneNumber(String number) {
    String result = number.replaceAll(RegExp(r'\+\d{1,3}'), '');
    result = result.replaceAll(RegExp(r'\s'), '');
    return result;
  }

  static Future<void> makeDirectCall(String query) async {
    // Check and request CALL_PHONE permission
    if (await Permission.phone.request().isGranted) {
      final Uri telUri = Uri(
        scheme: 'tel',
        path: query,
      );

      // Launch call directly
      if (await canLaunchUrl(telUri)) {
        await launchUrl(telUri, mode: LaunchMode.externalNonBrowserApplication);
      } else {
        throw 'Could not launch $telUri';
      }
    } else {
      throw 'CALL_PHONE permission not granted';
    }
  }
}
