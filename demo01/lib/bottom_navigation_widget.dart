import 'package:flutter/material.dart';
import 'pages/about.dart';
import 'pages/category.dart';
import 'pages/home.dart';
import 'pages/hot.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {

  final bottomColor = Colors.lightBlue;
  int _currentIndex = 0;
  List<Widget> widgetList = new List();


  @override
  void initState() { 
    super.initState();
    widgetList 
     ..add(HomeWieget()) //.. 建造者模式,谁调用的，返回的还是原类型
     ..add(HotWidget())
     ..add(CategoryWidget())
     ..add(AboutWidget());
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: widgetList[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,color:bottomColor),
              title: Text("首页",style: TextStyle(color: bottomColor),)
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.airplay,color:bottomColor),
              title: Text("热卖",style: TextStyle(color: bottomColor))
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.edit,color:bottomColor),
              title: Text("分类",style: TextStyle(color: bottomColor))
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.people,color:bottomColor),
              title: Text("我的",style: TextStyle(color: bottomColor))
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (int index){
            setState(() {
                _currentIndex = index; 
            });
          },
        ),
      );
  }
}