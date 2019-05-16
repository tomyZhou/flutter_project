import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'customer_router.dart';
import 'publish_content.dart';

class NewsWidget extends StatefulWidget {
  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  List data;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("加载更多");
      }
    });
    getNewsByHttp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: data != null ? _getItem() : _getLoading()),
    );
  }

  //http方式 请求数据
  void getNewsByHttp() async {
    await http
        .get("http://www.wanandroid.com/project/list/1/json?cid=1")
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode != 200) {
        throw new Exception("Error while fetch data");
      } else {
        print(res);
        var convertDataToJson = json.decode(res);
        convertDataToJson = convertDataToJson["data"]["datas"];
        setState(() {
          //触发build
          data = convertDataToJson;
        });
        convertDataToJson.forEach((item) {
          print(item);
        });
      }
    });
  }

  List<Widget> _getItem() {
    // map 就是遍历 iterable
    return data.map((item) {
      return GestureDetector(
          onTap: () {
            _goWebView(item);
          },
          child: Card(
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      new Flexible(
                          flex: 1,
                          fit: FlexFit.tight, //和android的weight=1效果一样
                          child: Stack(
                            children: <Widget>[
                              new Column(
                                children: <Widget>[
                                  new Text("${item["title"]}".trim(),
                                      style: new TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                      ),
                                      textAlign: TextAlign.left),
                                  new Text(
                                    "${item["desc"]}",
                                    maxLines: 3,
                                  )
                                ],
                              )
                            ],
                          )),
                      new ClipRect(
                        child: new FadeInImage.assetNetwork(
                          placeholder: "images/ic_shop_normal.png",
                          image: "${item['envelopePic']}",
                          width: 50.0,
                          height: 70.0,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  ))));
    }).toList();
  }

  //加载中
  List<Widget> _getLoading() {
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

  void _goWebView(var item) {

        // Navigator.of(context).push(CustomerRouter(
        //  WebviewScaffold(
        //   url: item['link'],
        //   appBar: AppBar(
        //     title: Text(
        //       item['desc'],
        //       maxLines: 1,
        //       // overflow: TextOverflow.ellipsis,
        //     ),
        //   ),
        //   // withZoom: false,
        //   // withJavascript: true,
        //   // withLocalStorage: true,
        // )
        // ));

        Navigator.push(context, CustomerRouter(
          WebviewScaffold(
            url: item['link'],
            appBar: AppBar(
              title: Text(
                item['desc'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            withZoom: false,
            withJavascript: true,
            withLocalStorage: true,
        )
        ));
  }
}
