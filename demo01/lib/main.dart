import 'package:flutter/material.dart';
import "package:demo01/bottom_navigation_widget.dart";
import 'package:demo01/special_bottom_navigation_widget.dart';
import 'blur_glass_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(),
        home: SpecialBottomNavigationWidget());
        // home: BlurGlassWidget());
  }
}
