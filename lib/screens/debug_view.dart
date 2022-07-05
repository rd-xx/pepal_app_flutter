import 'package:flutter/material.dart';
import 'package:pepal_app/widgets/botnav_view.dart';

class DebugView extends StatefulWidget {
  const DebugView({Key? key}) : super(key: key);

  @override
  State<DebugView> createState() => _DebugViewState();
}

class _DebugViewState extends State<DebugView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomNavView(currentIndex: 3),
    );
  }
}
