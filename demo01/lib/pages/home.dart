import 'package:flutter/material.dart';

class HomeWieget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Center(child: Text("我是首页")),
    );
  }
}
