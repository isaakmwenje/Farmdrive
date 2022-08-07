import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  final int maxLines ;
  final int colorValue;
  final double size;
  const SmallText({Key? key,required this.text,this.maxLines=15,this.colorValue=0xDD000000,this.size:16}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize:size,
        fontWeight:FontWeight.w600,
        color:Color(colorValue),
      ),
       maxLines:maxLines,
    );
  }
}
