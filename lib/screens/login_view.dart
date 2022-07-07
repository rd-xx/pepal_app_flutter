import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../widgets/botnav_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
              TextFormField(
                decoration: InputDecoration(
                    icon: const Icon(Icons.email),
                    labelText: AppLocalizations.of(context)!.username),
              ),
              TextFormField(
                decoration: InputDecoration(
                    icon: const Icon(Icons.password),
                    labelText: AppLocalizations.of(context)!.password),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
              ElevatedButton.icon(
                onPressed: () => Get.to(const LoginView()),
                icon: const Icon(Icons.person_add),
                label: Text(AppLocalizations.of(context)!.login),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
