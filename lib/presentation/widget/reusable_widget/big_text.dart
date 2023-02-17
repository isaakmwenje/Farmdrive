import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  int maxLines;
  String text;
  double size;
  Color color;
  FontWeight fontWeight;
  double letterSpacing;
  BigText({Key? key,required this.text,this.color = Colors.black,this.size = 22,this.fontWeight = FontWeight.w600,this.letterSpacing=0.0,this.maxLines = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:TextStyle(
        letterSpacing:letterSpacing,
        fontSize:size,
        fontWeight:fontWeight,
        color:color,
        overflow:TextOverflow.ellipsis,
      ),
      maxLines:maxLines,
    );
  }
}
