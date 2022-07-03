import 'package:flutter/material.dart';
import 'package:pepal_app/screens/home_view.dart';

import 'grades_view.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({Key? key, required this.title, required this.selectIndex})
      : super(key: key);

  final String title;
  final int selectIndex;

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Drawer(
        child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            widget.title,
            style: textTheme.headline6,
          ),
        ),
        const Divider(
          height: 1,
          thickness: 1,
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Accueil'),
          selected: widget.selectIndex == 0,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomeView(title: "Accueil")));
          },
        ),
        ListTile(
          leading: const Icon(Icons.school),
          title: const Text('Notes'),
          selected: widget.selectIndex == 1,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const GradesView(title: "Notes")));
          },
        ),
        const Divider(
          height: 1,
          thickness: 1,
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Paramètres'),
          selected: widget.selectIndex == 3,
        ),
      ],
    ));
  }
}
