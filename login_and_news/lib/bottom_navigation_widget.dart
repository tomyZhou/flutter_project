import 'package:flutter/material.dart';
import 'news.dart';
import 'film.dart';
import 'picture.dart';

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
     ..add(NewsWidget()) //.. 建造者模式,谁调用的，返回的还是原类型
     ..add(PictureWidget())
     ..add(FilmWidget());
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
              title: Text("美图",style: TextStyle(color: bottomColor))
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.edit,color:bottomColor),
              title: Text("电影",style: TextStyle(color: bottomColor))
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