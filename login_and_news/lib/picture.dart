import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

class PictureWidget extends StatefulWidget {
  @override
  _PictureWidgetState createState() => _PictureWidgetState();
}

class _PictureWidgetState extends State<PictureWidget> {
  List data;
  var _result;

  @override
  void initState() {
    super.initState();
    getPicture();
  }

  //httpClient方式请求数据
  void getPicture() async {
    var responseBody;

    try {
      var httpClient = new HttpClient();
      var request = await httpClient
          .getUrl(Uri.parse("http://gank.io/api/data/%E7%A6%8F%E5%88%A9/10/1"));
      var response = await request.close();
      if (response.statusCode == 200) {
        //拿到请求的数据
        responseBody = await response.transform(utf8.decoder).join();
        _result = json.decode(responseBody);
        _result = _result['results'];
        // print(_result);
        setState(() {
          data = _result;
        });
        _result.forEach((item) {
          print(item['url']);
        });
        //解析json，拿到对应的jsonArray数据
      } else {
        _result = 'error code : ${response.statusCode}';
      }
    } catch (exception) {
      _result = "网络异常";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(5.0),
        color: Colors.white,
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            childAspectRatio: 0.7,
          ),
          children: data!=null?_buildItems():[],
        ),
      ),
    );
  }

  List<Widget> _buildItems() {
    return data.map((item) {
      return Image.network(item['url'],fit: BoxFit.cover,);
    }).toList();
  }

    //加载中
  List<Widget> _buildLoading() {
    return <Widget>[
      Container(

        height: 300.0,
        child: new Center(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new CircularProgressIndicator(
              strokeWidth: 1.0,
            ),
            new Text("正在加载")
          ],
        )),
      )
    ];
  }
}
