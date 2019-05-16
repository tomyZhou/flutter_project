import 'package:flutter/material.dart';

// void main() => runApp(MyApp(  //动态ListView列表
//     items:new List<String>.generate(500, (i)=>"Item $i")

// ));

void main() => runApp(MyApp());

//******************************************** 1.TextView组件***********************************//
//  class MyApp extends StatelessWidget{
//  @override
//  Widget build(BuildContext buildContext){
//    return MaterialApp(
//      title: 'TextView组件使用',
//      home: Scaffold(
//        body: Center(
//          child: Container(
//            child: new Text('Hello Mr Zhou',style:TextStyle(fontSize: 40.0,color: Colors.white)),
//            alignment: Alignment.center,
//            width: 500.0,
//            height: 400.0,
//           //  color: Colors.lightBlue,
//            decoration:new BoxDecoration(
//              gradient: const LinearGradient(
//                colors: [Colors.green,Colors.lightBlue,Colors.purple]
//              ),
//              border: Border.all(width: 5.0,color: Colors.red)
//            ),
//            padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
//            margin: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
//          ),
//        ),
//      ),
//    );
//  }
//  }

//******************************************** 2.Image组件***********************************//
// class MyApp extends StatelessWidget{

//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       title: "Image组件使用",
//       home: Scaffold(
//         body: Center(
//           child:Container(
//             child: new Image.network(
//               "http://blogimages.jspang.com/blogtouxiang1.jpg",
//               repeat: ImageRepeat.repeat,
//               // fit: BoxFit.fill,
//               color: Colors.orange,
//               colorBlendMode: BlendMode.darken,
//             ),
//             width: 300.0,
//             height: 200.0,
//             color: Colors.pink,
//             padding: const EdgeInsets.all(10.0),
//           ),
//         ),
//       ),
//     );
//   }
// }

//********************************* 静态ListView列表 **********************/
// class MyApp extends StatelessWidget{

//   final List<String> items;
//   MyApp({Key key,@required this.items}):super(key:key);

//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       title: "ListView列表组件使用",
//       home: Scaffold(
//         appBar: new AppBar(title: new Text("ListView Widget")),
//         body: new ListView(
//           scrollDirection: Axis.vertical,
//           children: <Widget>[
//             new ListTile(
//               leading: new Icon(Icons.ac_unit),
//               title: new Text("我是listview内容1"),
//             ),
//               new ListTile(
//               leading: new Icon(Icons.access_alarm),
//               title: new Text("我是listview内容2"),
//             ),
//               new ListTile(
//               leading: new Icon(Icons.android),
//               title: new Text("我是listview内容3"),
//             ),new Image.network("http://blogimages.jspang.com/blogtouxiang1.jpg")
//           ],
//         ),
//       ),
//     );
//   }
// }

//************************动态列表ListView***********************//
// class MyApp extends StatelessWidget{

//   final List<String> items;
//   MyApp({Key key,@required this.items}):super(key:key);

//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       title: "ListView动态列表组件使用",
//       home: Scaffold(
//         appBar: new AppBar(title: new Text("ListView Widget")),
//         body: new ListView.builder(
//           itemCount: items.length,
//           itemBuilder: (context,index){
//             return new ListTile(
//               title: new Text('我是${items[index]}'),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

//*****************************GridView组件demo1****************** */
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "GridView网格",
//       home: Scaffold(
//         appBar: new AppBar(
//           title: new Text("GridView"),
//         ),
//         body: GridView.count(
//           padding: const EdgeInsets.all(20.0),
//           crossAxisSpacing: 10.0,
//           crossAxisCount: 4,
//           children: <Widget>[
//             const Text("天猫超市"),
//             const Text("农资工具"),
//             const Text("天猫优品"),
//             const Text("淘香甜"),
//             const Text("全部分类"),
//             const Text("9.9特卖"),
//               new Image.network(
//               "http://blogimages.jspang.com/blogtouxiang1.jpg",
//             ),
//             const Text("淘金币")
//           ],
//         ),
//       ),
//     );
//   }
// }

//*****************************GridView组件demo2****************** */
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "GridView网格组件",
//       home: Scaffold(
//         appBar: new AppBar(
//           title: new Text("GridView"),
//         ),
//         body: Container(
//           padding: const EdgeInsets.all(5.0),
//           color: Colors.lime,
//           child: GridView(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3,
//               mainAxisSpacing: 5.0, //纵轴的间距
//               crossAxisSpacing: 5.0, //横轴的间距
//               childAspectRatio: 0.7),
//           children: <Widget>[
//             new Image.network(
//                 "http://img5.mtime.cn/mt/2018/10/18/105718.67943222_180X260X4.jpg",
//                 fit: BoxFit.cover),
//             new Image.network(
//                 "http://img5.mtime.cn/mt/2019/03/29/095608.66203322_180X260X4.jpg",
//                 fit: BoxFit.cover),
//             new Image.network(
//                 "http://img5.mtime.cn/mg/2018/12/28/103955.13494695_270X405X4.jpg",
//                 fit: BoxFit.cover),
//             new Image.network(
//                 "http://img5.mtime.cn/mt/2019/04/25/110447.37092576_180X260X4.jpg",
//                 fit: BoxFit.cover),
//             new Image.network(
//                 "http://img5.mtime.cn/mt/2019/01/25/100901.82440600_180X260X4.jpg",
//                 fit: BoxFit.cover),
//             new Image.network(
//                 "http://img5.mtime.cn/mt/2019/02/26/103752.98077593_180X260X4.jpg",
//                 fit: BoxFit.cover),
//             new Image.network(
//                 "http://img5.mtime.cn/mt/2018/10/18/105718.67943222_180X260X4.jpg",
//                 fit: BoxFit.cover),
//             new Image.network(
//                 "http://img5.mtime.cn/mg/2018/12/28/103955.13494695_270X405X4.jpg",
//                 fit: BoxFit.cover),
//           ],
//         ),
//         ),
//       ),
//     );
//   }
// }

//***************************水平、垂直布局组件*****************************/
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "水平布局组件",
//       home: Scaffold(
//         appBar: new AppBar(
//           title: new Text("水平布局"),
//         ),
//         body: new Column(
//           children: <Widget>[
//             new RaisedButton(
//               onPressed: () {},
//               color: Colors.red,
//               child: new Text("红色按钮"),
//             ),
//             new Row(
//               children: <Widget>[
//                 Expanded(
//                     child: new RaisedButton(
//                   onPressed: () {},
//                   color: Colors.blue,
//                   child: new Text(
//                     "蓝色按钮",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 )),
//                 Expanded(
//                     child: new RaisedButton(
//                   onPressed: () {},
//                   color: Colors.blue,
//                   child: new Text(
//                     "蓝色按钮",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 )),
//                   Expanded(
//               child: new RaisedButton(
//               onPressed: () {},
//               color: Colors.blue,
//               child: new Text(
//                 "蓝色按钮",
//                 style: TextStyle(color: Colors.white),
//               ),
//             )),
//               Expanded(
//               child: new RaisedButton(
//               onPressed: () {},
//               color: Colors.blue,
//               child: new Text(
//                 "蓝色按钮",
//                 style: TextStyle(color: Colors.white),
//               ),
//             )),
//               ],
//             ),
//             new RaisedButton(
//               onPressed: () {},
//               color: Colors.orange,
//               child: new Text("橙色按钮"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//*********************************层叠布局Stack组件,Positioned下组件******************* */
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var stack = new Stack(
//       children: <Widget>[
//         new CircleAvatar(
//           backgroundImage: new NetworkImage(
//               "http://blogimages.jspang.com/blogtouxiang1.jpg"),
//           radius: 100.0,
//         ),
//         new Container(
//           decoration: new BoxDecoration(
//             color: Colors.lightBlue,

//           ),
//           padding: const EdgeInsets.all(5.0),
//           child: Text("我是上层文本"),
//         ),
//         new Positioned(
//           top: 30.0,
//           left: 20.0,
//           child: new Text("我是position绝对定位"),
//         ),
//       ],
//       alignment: const FractionalOffset(0.5,0.8),
//     );
//     return MaterialApp(
//       title: "层叠布局组件",
//       home: Scaffold(
//         appBar: new AppBar(
//           title: new Text("stack层叠布局"),
//         ),
//         body: Center(
//           child: stack,
//         ),
//       ),
//     );
//   }
// }

//*************************** Card卡片组件******************************* */

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "卡片布局",
      home: Scaffold(
        appBar: new AppBar(
          title: Text("Card布局"),
        ),
        body: Card(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  "湖北省浠水县",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text("15810012830"),
                leading: new Icon(
                  Icons.account_box,
                  color: Colors.lightBlue,
                ),
              ),
              new Divider(),
              ListTile(
                title: Text(
                  "北京市北京理工大学",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text("15810012830"),
                leading: new Icon(
                  Icons.devices,
                  color: Colors.lightBlue,
                ),
              ),
              new Divider(),
              ListTile(
                title: Text(
                  "广东省广州市远望路",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text("18810012200"),
                leading: new Icon(
                  Icons.add,
                  color: Colors.lightBlue,
                ),
              ),
              new Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
