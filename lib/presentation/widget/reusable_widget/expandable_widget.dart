import 'package:flutter/material.dart';
import 'package:untitled3/presentation/widget/reusable_widget/small_text.dart';

import 'big_text.dart';

class ExpandableWidget extends StatefulWidget {
  String text1;
  String text2;
  String text3;
  String text4;
  String text5;
  String text6;
  ExpandableWidget({Key? key,this.text1='health benefits',required this.text2, required this.text3,this.text4='',this.text5 = 'how to prepare',this.text6=''}) : super(key: key);

  @override
  _ExpandableWidgetState createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget> {

  bool hiddenText = true;
  @override
  Widget build(BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(left:16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Padding(
                padding: const EdgeInsets.only(left:24.0,bottom:4.0,top:8.0),
                child: BigText(text:widget.text1,color:Colors.black87,size:18),
              ),
              SmallText(text:widget.text2,),
              SmallText(text:widget.text3,maxLines:1),
              hiddenText ? Row(children:[
                const SmallText(text:' ...'),
                const SizedBox(width: 30,),
                inkwell()
              ]):Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                SmallText(text:widget.text4),
                  Padding(
                  padding: const EdgeInsets.only(left:24.0,bottom:4.0,top:8.0),
                  child: BigText(text:widget.text5,color:Colors.black87,size:18),
                ),
                SmallText(text:widget.text6),
                inkwell()
              ]),


            ]
          ),
        );
  }
  Widget inkwell() {
    return InkWell(
        onTap:(){
          setState((){
            hiddenText =!hiddenText;
          });
        },
        child:SmallText(text:hiddenText?'show more':'show less',colorValue:0xFF0091EA)
    );
}
}
