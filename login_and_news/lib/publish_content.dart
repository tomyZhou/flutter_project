import 'package:flutter/material.dart';

class PublishContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "发布内容",
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: Text("发布内容"),
          elevation: 4.0,
          backgroundColor: Colors.lightBlue,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Center(child:Text(
              "好好学习",
              style: TextStyle(color: Colors.white, fontSize: 36.0),
            )),
            Center(child:Text(
              "天天向上",
              style: TextStyle(color: Colors.white, fontSize: 36.0),
            )),
          ],
        ),
      ),
    );
  }
}
