import 'package:flutter/material.dart';

import 'appbar_view.dart';
import 'drawer_view.dart';

class GradesView extends StatefulWidget {
  const GradesView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<GradesView> createState() => _GradesViewState();
}

class _GradesViewState extends State<GradesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarView(title: widget.title),
      drawer: DrawerView(title: widget.title, selectIndex: 1),
    );
  }
}
