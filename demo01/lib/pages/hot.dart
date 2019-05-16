import 'package:flutter/material.dart';

class HotWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("热销"),
      ),
      body: Center(child: Text("热销商品")),
    );
  }
}
