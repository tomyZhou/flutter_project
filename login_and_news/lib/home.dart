import 'package:flutter/material.dart';
import 'bottom_navigation_widget.dart';

class HomeWdiget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "首页",
      home: BottomNavigationWidget()
    );
  }
}
