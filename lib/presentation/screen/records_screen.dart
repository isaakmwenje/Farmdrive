import 'package:flutter/material.dart';
import 'package:untitled3/presentation/widget/records_analysis_caoresel.dart';
import 'package:untitled3/presentation/widget/records_nav_bar.dart';
import 'package:untitled3/presentation/widget/records_notification_caoresel.dart';
import 'package:untitled3/presentation/widget/records_orders_caoresel.dart';

class RecordsScreen extends StatefulWidget {
  const RecordsScreen({Key? key}) : super(key: key);

  @override
  _RecordsScreenState createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> with SingleTickerProviderStateMixin {

  TabController? _controller;
  @override
  void initState(){
    super.initState();
    _controller = TabController(length:2,vsync:this,initialIndex:0);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
            title:const Text(
                'Farmdrive',
                style:TextStyle(
                    color: Colors.white,
                    fontSize:35,
                    fontWeight: FontWeight.w800,
                )
            ),
            actions:const [

              CircleAvatar(
                 radius: 20,
        ),
              SizedBox(width: 22,),
        ],
        bottom:TabBar(
          controller: _controller,
          tabs:const [
             Tab(
               text:'ORDERS',
             ),
            Tab(
              text:'ANALYSIS'
            ),
          ]
        )
      ),
      body:TabBarView(
        controller:_controller,
        children:const [
           OrdersCaoresel(),
           AnalysisCaoresel(),
        ]
      )
    );
  }
}
