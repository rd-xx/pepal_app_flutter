import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;

import '../widgets/botnav_view.dart';

Future<http.Response> login(String username, String password) async {
  var map = <String, dynamic>{};
  map["login"] = username;
  map["pass"] = password;

  final response = await http
      .post(Uri.parse("https://www.pepal.eu/include/php/ident.php"), body: map);

  print(response.headers);
  return response;
}

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Future<http.Response>? _futureCookie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavView(currentIndex: 3),
      body: Center(
        widthFactor: 5.0,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(48.0, 0.0, 48.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo.png",
                width: 100,
                height: 50,
              ),
              (_futureCookie == null) ? buildColumn() : buildFutureBuilder(),
            ],
          ),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextFormField(
          controller: _usernameController,
          decoration: InputDecoration(
              icon: const Icon(Icons.email),
              labelText: AppLocalizations.of(context)!.username),
        ),
        TextFormField(
          controller: _passwordController,
          decoration: InputDecoration(
              icon: const Icon(Icons.password),
              labelText: AppLocalizations.of(context)!.password),
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
        ),
        ElevatedButton.icon(
          onPressed: () {
            setState(() {
              _futureCookie =
                  login(_usernameController.text, _passwordController.text);
            });
          },
          icon: const Icon(Icons.person_add),
          label: Text(AppLocalizations.of(context)!.login),
        ),
      ],
    );
  }

  FutureBuilder<http.Response> buildFutureBuilder() {
    return FutureBuilder<http.Response>(
      future: _futureCookie,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.headers.toString());
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
