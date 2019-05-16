//毛玻璃效果

import 'package:flutter/material.dart';
import 'dart:ui';

class BlurGlassWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text("毛玻璃效果"),
          ),
          body: Stack( //层叠组件
            children: <Widget>[
              ConstrainedBox( //约束盒子,可以对child添加额外的约束条件
                constraints: const BoxConstraints.expand(),
                child: Image.network("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557487539834&di=a4276978fe4bf96a7a2d7b3dd1019e13&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fsoftbbs%2F1101%2F26%2Fc0%2F6643524_1296047881107_1024x1024soft.jpg"),
              ),
              Center(
                child: ClipRect( //可裁切的矩形
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX:5.0 ,sigmaY:5.0 ,
                    ),
                    child: Opacity(
                      opacity: 0.01,
                      child: Container(
                        width:300.0,
                        height:100.0,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),          
      );
  }
}