import 'package:flutter/material.dart';
import 'login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    futureDemo();
    print("我是在后面");
    return MaterialApp(
        title: "login",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: LoginPage());
  }

  void futureDemo() async{
    var number =10;
    new Future((){print("初始化");}).then((_){print("等待A");}).then((_){print("等待B");}).whenComplete((){print("completed");});

    new Future((){return 1+2;}).then((number){return number;});

    Future<num> future = new Future<num>((){number = number+5;return number;}).whenComplete((){print("初始化结束,number=$number");}).then((a){a = a+10; return a;}).whenComplete((){print("number=$number");}).then((n){n = n+20;return n;}).whenComplete((){print("结束了,$number");});
    number = await future;
    print("我是number$number");
  }

 
}
