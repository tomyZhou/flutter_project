import 'package:flutter/material.dart';

class CustomerRouter extends PageRouteBuilder {
   Widget widget;

  CustomerRouter(this.widget)
      : super(
          transitionDuration: Duration(
            
            seconds: 1),
            pageBuilder:(BuildContext context,Animation<double> animation1,Animation<double> animation2){ //匿名内部类
              return widget;
            },
            transitionsBuilder:(BuildContext context,Animation<double> animation1,Animation<double> animation2,Widget child){
              //渐变切换页面
              // return FadeTransition(
              //   opacity: Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(
              //     parent: animation1,
              //     curve: Curves.fastLinearToSlowEaseIn//动画曲线：先快后慢，匀速变化等
              //   )),
              //   child: child,
              // );

              //缩放切换页面
              return ScaleTransition(
                scale: Tween(begin: 0.0,end: 1.0).animate(
                  CurvedAnimation(
                    parent: animation1,
                    curve: Curves.fastOutSlowIn
                  )
                ),
                child: child,
              );

              //旋转切换页面
              // return RotationTransition(
              //   turns: Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(
              //     parent: animation1,
              //     curve: Curves.fastOutSlowIn,
              //     )),
              //     child: ScaleTransition(
              //       scale: Tween(begin: 0.0,end: 1.0).animate(
              //         CurvedAnimation(
              //           parent: animation1,
              //           curve: Curves.fastOutSlowIn
              //         )
              //       ),
              //       child: child
              //     ),
              // );

              //左右滑动切换页面
              // return SlideTransition(position: Tween<Offset>(begin: Offset(-1.0, 0.0),end: Offset(0.0,0.0)).animate(
              //   CurvedAnimation(
              //     parent: animation1,
              //     curve: Curves.fastOutSlowIn
              //   )),
              //   child: child,
              // );
            
            }
        );
}
