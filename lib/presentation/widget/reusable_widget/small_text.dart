import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  final int maxLines ;
  final Color color;
  final double size;
  const SmallText( {Key? key,required this.text,this.maxLines=15,this.color
  =Colors.black87,this.size=16, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        height:0,
        fontSize:size,
        fontWeight:FontWeight.w400,
        color:color,
      ),
       overflow: TextOverflow.ellipsis,
       maxLines:maxLines,
    );
  }
}
