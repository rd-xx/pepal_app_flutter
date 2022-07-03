import 'package:flutter/material.dart';

class AppBarView extends StatefulWidget implements PreferredSizeWidget {
  const AppBarView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AppBarView> createState() => _AppBarStats();

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _AppBarStats extends State<AppBarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              bool drawerState = Scaffold.of(context).isDrawerOpen;
              if (drawerState == true) {
                Scaffold.of(context).closeDrawer();
              } else {
                Scaffold.of(context).openDrawer();
              }
            },
          ),
          title: Text(widget.title),
          backgroundColor: Colors.black87),
    );
  }
}
