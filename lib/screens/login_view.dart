import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:pepal_app/classes/pepal_class.dart';

import '../widgets/botnav_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Pepal pepalController = Pepal();
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
              const SizedBox(height: 60),
              (_futureCookie == null) ? loginForm() : futureBuilder(),
            ],
          ),
        ),
      ),
    );
  }

  Column loginForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextFormField(
          controller: _usernameController,
          decoration: InputDecoration(
              icon: const Icon(Icons.email),
              labelText: AppLocalizations.of(context)!.username),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: _passwordController,
          decoration: InputDecoration(
              icon: const Icon(Icons.password),
              labelText: AppLocalizations.of(context)!.password),
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
        ),
        const SizedBox(height: 50),
        ElevatedButton.icon(
          onPressed: () {
            setState(() {
              _futureCookie = pepalController.login(
                  _usernameController.text, _passwordController.text);
            });
          },
          icon: const Icon(Icons.person_add),
          label: Text(AppLocalizations.of(context)!.login),
        ),
      ],
    );
  }

  FutureBuilder<http.Response> futureBuilder() {
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
