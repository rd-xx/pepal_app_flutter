import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pepal_app/widgets/botnav_view.dart';

import 'login_view.dart';

class DebugView extends StatefulWidget {
  const DebugView({Key? key}) : super(key: key);

  @override
  State<DebugView> createState() => _DebugViewState();
}

class _DebugViewState extends State<DebugView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavView(currentIndex: 3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () => Get.to(() => const LoginView()),
              icon: const Icon(Icons.person_add),
              label: const Text("Login view"),
            ),
          ],
        ),
      ),
    );
  }
}
