import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
          title: Text(AppLocalizations.of(context)!.drawerCategory1),
          selected: widget.selectIndex == 0,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeView(
                        title: AppLocalizations.of(context)!.drawerCategory1)));
          },
        ),
        ListTile(
          leading: const Icon(Icons.school),
          title: Text(AppLocalizations.of(context)!.drawerCategory2),
          selected: widget.selectIndex == 1,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GradesView(
                        title: AppLocalizations.of(context)!.drawerCategory2)));
          },
        ),
        const Divider(
          height: 1,
          thickness: 1,
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: Text(AppLocalizations.of(context)!.drawerCategory3),
          selected: widget.selectIndex == 3,
        ),
      ],
    ));
  }
}
