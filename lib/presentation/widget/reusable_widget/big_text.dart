import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  String text;
  double size;
  Color color;
  FontWeight fontWeight;
  BigText({Key? key,required this.text,this.color = Colors.black,this.size = 22,this.fontWeight = FontWeight.w600}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:TextStyle(
        fontSize:size,
        fontWeight:fontWeight,
        color:color,
      )
    );
  }
}
