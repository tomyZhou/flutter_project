import 'package:flutter/material.dart';
import 'search_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "滑动菜单",
      theme: ThemeData.light(),
      home:SearchBarWidget(),
    );
  }
}

//************************动态控件*************************//

class ViewPagerWidget extends StatefulWidget {
  @override
  _ViewPagerWidgetState createState() => _ViewPagerWidgetState();
}

class _ViewPagerWidgetState extends State<ViewPagerWidget> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this); //3个tab
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabBar"),
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.ac_unit)),
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.verified_user)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          Text("1111111111111"),
          Text("2222222222222"),
          Text("3333333333333")
        ],
      ),
    );
  }
}
