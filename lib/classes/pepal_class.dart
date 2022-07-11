import 'dart:convert';

import 'package:http/http.dart' as http;

class Pepal {
  Future<http.Response> login(String username, String password) async {
    final response = await http.post(
        Uri.parse("https://www.pepal.eu/include/php/ident.php"),
        body:
            jsonEncode(<String, String>{'login': username, 'pass': password}));

    return response;
  }
}
