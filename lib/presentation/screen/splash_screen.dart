import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'nav_screen.dart';

class  SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<SplashScreen>with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  initState(){
    super.initState();
    animationController =
        AnimationController(vsync: this,
            duration:const Duration(seconds:3))..forward();
    animation = CurvedAnimation(parent:animationController,curve:Curves.elasticOut);


    Timer(
      const Duration(seconds: 3),
        ()=> Get.off(()=>const NavScreen())
    );
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:   [
          ScaleTransition(
            scale:animation,
            child: const Image(
              image:AssetImage('assets/logo/vegetable_logo.png'),
              height:130,
              width:130,
            ),
          ),
          Center(
            child: Text(
                'Farmdrive',
                style:TextStyle(
                    color: Colors.lightGreen.shade800,
                    fontSize:35,
                    fontWeight: FontWeight.bold
                )
            ),
          ),
        ],
      )
    );
  }
}
