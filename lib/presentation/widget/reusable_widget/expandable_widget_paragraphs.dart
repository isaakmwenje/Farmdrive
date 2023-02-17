import 'package:flutter/material.dart';
import 'package:Farmdrive/presentation/widget/reusable_widget/small_text.dart';

class ExpandedParagraph extends StatefulWidget {
  String text;
  ExpandedParagraph({Key? key,required this.text}) : super(key: key);

  @override
  State<ExpandedParagraph> createState() => _ExpandedParagraphState();
}

class _ExpandedParagraphState extends State<ExpandedParagraph> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = false;
  double textHeight = 154.0;

  @override
  void initState() {
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else if (widget.text.length < textHeight) {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  secondHalf.isEmpty ?SmallText(text:firstHalf):
      Column(children:[
         SmallText(text:hiddenText?(firstHalf+secondHalf):firstHalf),
         Row(
           children:[
              !hiddenText?const SmallText(text:'...   '):const SizedBox.shrink(),
             InkWell(
                 onTap: () {
                   setState(() {
                     hiddenText = !hiddenText;
                   });
                 },
                 child: Container(
                     child: Row(
                       children: [
                         SmallText(text: hiddenText ? 'show less' : 'show more',
                             color:Colors.red),
                       ],
                     )
                 )
             )
           ]
         )
      ]),
    );
  }
}