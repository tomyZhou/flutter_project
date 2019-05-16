import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'home.dart';
import 'package:dio/dio.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _pwdEditController;
  TextEditingController _userNameEditController;

  final FocusNode _userNameFocusNode = FocusNode();
  final FocusNode _pwdFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _pwdEditController = TextEditingController();
    _userNameEditController = TextEditingController();
    _pwdEditController.addListener(() => setState(() => {}));
    _userNameEditController.addListener(() => setState(() => {}));
  }

  _buildTopBannerWidget() {
    return Container(
      child: Image.asset(
        "assets/images/header_icon.jpg",
        fit: BoxFit.cover,
      ),
    );
  }

  _buildAccountLoginTip() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Text(
        "百卓采购网/中国制造网会员登录",
        maxLines: 1,
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: 16, color: Colors.black54),
      ),
    );
  }

  _buildLoginNameTextField() {
    return TextField(
      controller: _userNameEditController,
      focusNode: _userNameFocusNode,
      decoration: InputDecoration(
          hintText: "登录名/邮箱/手机",
          border: InputBorder.none,
          prefixIcon: Image.asset(
            "assets/images/icon_user.jpg",
            fit: BoxFit.none,
          ),
          suffixIcon: (_userNameEditController.text).isEmpty
              ? IconButton(
                  icon: Image.asset(
                    "assets/images/icon_scan.jpg",
                    fit: BoxFit.cover,
                  ),
                  onPressed: () => {})
              : IconButton(
                  icon: Icon(
                    //Icon(IconData icon {Key key,Double size,Color color})  //大括号里的参数需要指定key：value
                    Icons.cancel,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    _userNameEditController.clear();
                    _userNameFocusNode.unfocus();
                    setState(() {});
                  },
                )),
    );
  }

  _buildPwdTextField() {
    return TextField(
        controller: _pwdEditController,
        focusNode: _pwdFocusNode,
        obscureText: true,
        decoration: InputDecoration(
          hintText: "密码",
          border: InputBorder.none,
          prefixIcon: Image.asset(
            "assets/images/icon_password.jpg",
            fit: BoxFit.none,
          ),
          suffixIcon: (_pwdEditController.text ?? "").isEmpty
              ? FlatButton(
                  child: Text("忘记密码"),
                  onPressed: () {
                    _pwdFocusNode.unfocus();
                    _userNameFocusNode.unfocus();
                  })
              : IconButton(
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    _pwdEditController.clear();
                    _pwdFocusNode.unfocus();
                    setState(() {});
                  }),
        ));
  }

  //两个输入框之间有一条1px分割线，分割线在Flutter中也有控件：Divider，最后编辑框组的实现如下
  _buildEditWidget() {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
            width: 1.0 / MediaQuery.of(context).devicePixelRatio,
            color: Colors.grey.withOpacity(0.5)),
      ),
      child: Column(
        children: <Widget>[
          _buildLoginNameTextField(),
          Divider(height: 1.0),
          _buildPwdTextField(),
        ],
      ),
    );
  }

  _buildLoginRegisterButton() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.grey.withOpacity(0.3),
              ),
              child: FlatButton(
                  onPressed: () {
                    if (_userNameEditController.text.isEmpty ||
                        _pwdEditController.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "用户名或密码为空",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          textColor: Colors.white,
                          backgroundColor: Colors.blueGrey);
                    } else {
                      _login();
                    }
                  },
                  child: Text(
                    "登录",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
          SizedBox(width: 15.0),
          Expanded(
              child: Container(
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(width: 1.0, color: Colors.green),
            ),
            child: FlatButton(
                onPressed: () {},
                child: Text(
                  "立即注册",
                  style: TextStyle(color: Colors.green),
                )),
          ))
        ],
      ),
    );
  }

  //各个部件都实现好了，现在就是组装的时候了，我们的采取从上到下的线性布局，Flutter可以用Column来实现

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTopBannerWidget(),
          _buildAccountLoginTip(),
          _buildEditWidget(),
          _buildLoginRegisterButton(),
        ],
      )),
    );
  }

  _login() async {

    String _result = "";

    try {
      print("登录中...");
      Response response;
      Dio dio = new Dio();
      response = await dio.post("/login",
          data: {"id": 12, "name": "zhougang", "password": "123456"});

      print(response.data.toString());
      if (response.statusCode == 200) {
        _decodeTest(response.data);
      } else {
        _result = 'error code : ${response.statusCode}';
      }
      print("登录成功");
    } catch (exception) {
      print("网络错误!");
      if (_userNameEditController.text == "zhougang" &&
          _pwdEditController.text == "123456") {
        Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(
          builder: (BuildContext context) {
            return HomeWdiget();
          },
        ), (router) => router == null);
      } else {
        Fluttertoast.showToast(msg: "用户名或密码不正确");
      }
    }
  }

  _decodeTest(var body) {
    bool usertxt = body['success'];
    String errMess = body['message'];
    if (usertxt == false) {
      Fluttertoast.showToast(msg: "登录失败");
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(builder: (context) => new HomeWdiget()),
          (route) => route == null);
    }
  }
}
