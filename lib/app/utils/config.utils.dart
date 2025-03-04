import 'dart:math';

import 'package:open_library/core/values/environments.dart';
import 'package:open_library/core/values/globals.dart';

class ConfigUtils{


  static String formatAuthors(List<String> authors) {
    if (authors.isEmpty) return "";

    // Si hay un solo autor, devolver solo su nombre
    if (authors.length == 1) return "de ${authors.first}";

    // Para múltiples autores, concatenar con comas y "y" antes del último
    String formattedAuthors = authors.sublist(0, authors.length - 1).join(', ') +
        " y ${authors.last}";

    return "de $formattedAuthors";
  }

  static String formatListText(List<String> publishers) {
    if (publishers.isEmpty) return "";


    if (publishers.length == 1) return "${publishers.first}";

    String formattedAuthors = publishers.sublist(0, publishers.length - 1).join(', ') +
        " y ${publishers.last}";

    return "de $formattedAuthors";
  }

  static convertURKBookImage(String coverI){
    if(coverI != "null" && coverI.isNotEmpty){
      return Environments.apiImages
          + "/"
          + Globals.extensionImageBook
          + "/"
          + coverI
          + Globals.extensionJPG;
    } else return "";
  }

  static int calculateAge(DateTime birthDate) {
    final today = DateTime.now();
    int age = today.year - birthDate.year;

    // Ajustar si la fecha de nacimiento aún no ha ocurrido en este año
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    return age;
  }



  static String getRandomLetter() {
    final random = Random();
    return Globals.alphabet[random.nextInt(Globals.alphabet.length)];
  }

}