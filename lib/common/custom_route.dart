import 'package:flutter/material.dart';

//自定义的路由方法
class CustomRoute extends PageRouteBuilder {
  final Widget widget;

  //重写构造方法（一调用该方法就执行的方法 就叫构造方法）
  CustomRoute(this.widget)
      : super(
            //父类的方法
            //设置动画持续的时间，建议再1和2之间
            transitionDuration: const Duration(seconds: 1),
            //页面的构造器
            pageBuilder: (
              BuildContext context,
              Animation<double> animation1,
              Animation<double> animation2,
            ) {
              return widget;
            },
            //过度效果
            transitionsBuilder: (BuildContext context,
                Animation<double> animation1,
                Animation<double> animation2,
                Widget child) {
              // 过度的动画的值
              // return FadeTransition(
              //   // 过度的透明的效果
              //   opacity: Tween(begin: 0.0, end: 1.0)
              //       // 给他个透明度的动画   CurvedAnimation：设置动画曲线
              //       .animate(CurvedAnimation(
              //           //父级动画
              //           parent: animation1,
              //           //动画曲线
              //           curve: Curves.ease)),
              //   child: child,
              // );

              // return ScaleTransition(
              //   scale: Tween(begin: 0.0,end: 1.0)
              //       .animate(CurvedAnimation(
              //       parent: animation1,
              //       //快出慢进
              //       curve: Curves.fastOutSlowIn
              //   )),
              //   child: child,
              // );

              return RotationTransition(
                turns: Tween(begin: 0.0,end: 1.0)
                    .animate(CurvedAnimation(
                    parent: animation1,
                    curve: Curves.fastOutSlowIn
                )),
                child: ScaleTransition(
                  scale: Tween(begin: 0.0,end: 1.0)
                      .animate(CurvedAnimation(
                      parent: animation1,
                      curve: Curves.fastOutSlowIn
                  )),
                  child: child,
                ),
              );


            });
}
