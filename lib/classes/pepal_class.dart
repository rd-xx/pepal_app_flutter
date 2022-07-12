import 'package:http/http.dart' as http;

import 'grade_class.dart';

class Pepal {
  dynamic cookie;
  List<Grade> grades = [];

  Future<String> login(String username, String password) async {
    final response = await http.post(
        Uri.parse("https://www.pepal.eu/include/php/ident.php"),
        body: {"login": username, "pass": password});

    final String? responseCookies = response.headers["set-cookie"];
    if (responseCookies == null) {
      Future.error("");
    }

    final regexp = RegExp(r'(?<=sdv=)[^;]*');
    final String? cookie =
        regexp.firstMatch(responseCookies!)?.group(0).toString();

    if (cookie == null) {
      Future.error("");
    }

    this.cookie = cookie;
    return cookie!;
  }
}
