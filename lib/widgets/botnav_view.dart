import 'package:flutter/material.dart';
import 'package:pepal_app/screens/account_view.dart';
import 'package:pepal_app/screens/debug_view.dart';
import 'package:pepal_app/screens/home_view.dart';
import 'package:pepal_app/screens/schedule_view.dart';

class BottomNavView extends StatefulWidget {
  const BottomNavView({Key? key, required this.currentIndex}) : super(key: key);

  final int currentIndex;

  @override
  State<BottomNavView> createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.currentIndex,
      selectedFontSize: 0,
      unselectedFontSize: 0,
      iconSize: 35,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(label: "0", icon: Icon(Icons.home_rounded)),
        BottomNavigationBarItem(
            label: "1", icon: Icon(Icons.calendar_month_rounded)),
        BottomNavigationBarItem(label: "2", icon: Icon(Icons.manage_accounts)),
        BottomNavigationBarItem(
            label: "3", icon: Icon(Icons.bug_report_rounded))
      ],
      onTap: (index) {
        var views = const [
          HomeView(),
          ScheduleView(),
          AccountView(),
          DebugView()
        ];
        Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    views[index]));
      },
    );
  }
}
