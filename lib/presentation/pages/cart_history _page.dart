import 'package:flutter/material.dart';
import 'package:untitled3/controller/cart_controller.dart';
import 'package:untitled3/data/cart_model.dart';
import 'package:untitled3/presentation/widget/reusable_widget/big_text.dart';
import 'package:untitled3/presentation/widget/reusable_widget/small_text.dart';
import 'package:get/get.dart';
import 'package:untitled3/utilities/FormatDates.dart';
import 'package:intl/intl.dart';

class CartHistory extends StatefulWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  _CartHistoryState createState() => _CartHistoryState();
}

class _CartHistoryState extends State<CartHistory> {
  @override
  Widget build(BuildContext context) {
    int counter = 0;

    List<Cart> cartHistoryList = Get.find<CartController>().getCartHistory().reversed.toList();
    var cartHistoryMap = Map();

    for(int i=0;i<cartHistoryList.length;i++){
    if(cartHistoryMap.containsKey(getDate(cartHistoryList[i].time))){
      cartHistoryMap.update(getDate(cartHistoryList[i].time),(value)=>++value);
    }else{
      cartHistoryMap.putIfAbsent(getDate(cartHistoryList[i].time), () => 1);
    }
    }

    List cartHistoryNum = cartHistoryMap.entries.map((e) => e.value).toList();
    return Scaffold(
      backgroundColor: Colors.white,
       body:Column(
         children: [
           Container(
             alignment:Alignment.bottomCenter,
             height:120,
             width:double.infinity,
             color:Colors.blue,
             child:Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children:[
                 IconButton(
                   icon:const Icon(Icons.arrow_back,color:Colors.white),
                   onPressed: (){
                     Navigator.of(context).pop();
                   },
                 ),
                 BigText(text:'Your Cart Purchases',color:Colors.white),
                 const Icon(Icons.shop,color:Colors.white),
                 SizedBox(width: 4,),
               ]
             )
           ),
           Expanded(
             child: MediaQuery.removePadding(
               removeTop:true,
               context: context,
               child: ListView(

                   children:[
                     for(int i=0;i<cartHistoryMap.length;i++)
                   Container(
                   height:140,
                   width:double.infinity,
                   child:Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children:[
                         SizedBox(height:16),
                         Container(
                             margin:EdgeInsets.only(left:20),
                             padding:const EdgeInsets.symmetric(horizontal:12.0,vertical:6.0),
                             decoration: BoxDecoration(
                               color:const Color(0xFFE3F2FD),
                               borderRadius:BorderRadius.circular(12.0),
                             ),
                             child:  SmallText(text:getDate(cartHistoryList[counter].time),colorValue:0x8A000000, size:18)),
                         Stack(children:[
                           SizedBox(
                               height:80,
                               child:Padding(
                                 padding: const EdgeInsets.only(right:60),
                                 child: ListView(
                                   scrollDirection:Axis.horizontal,
                                     children:List.generate(cartHistoryNum[i],(index){
                                       if(counter<cartHistoryList.length){
                                         counter++;
                                       }
                                       DateTime dateTime = DateTime.parse(cartHistoryList[counter-1].time);
                                       return Stack(
                                           children:[
                                             Container(
                                               margin:EdgeInsets.only(left:8.0,top:4.0),
                                               height:150,
                                               width:100,
                                               decoration:BoxDecoration(
                                               borderRadius:BorderRadius.circular(3),
                                               border:Border.all(
                                               color:Colors.black12,
                                             ),
                                             image:DecorationImage(
                                               image:AssetImage(
                                               cartHistoryList[counter-1].image
                                               )
                                             )
                                             )
                                             ),
                                             Positioned(
                                               bottom:2,
                                               right:0,
                                               child: Container(
                                                 padding:const EdgeInsets.symmetric(horizontal:4.0,vertical:2.0),
                                                 decoration:BoxDecoration(
                                                   color:Colors.lightBlueAccent.withOpacity(0.7),
                                                   borderRadius:BorderRadius.only(
                                                     topLeft:Radius.circular(8.0),
                                                     bottomLeft:Radius.circular(8.0)
                                                   )
                                                 ),
                                                 child:Text(DateFormat('hh:mm a').format(dateTime),style:const TextStyle(
                                                   color:Colors.black,
                                                 )),
                                               ),
                                             )
                                           ]
                                       );
                                     })
                                 ),
                               )
                           ),
                           Positioned(
                             right:0,
                             top:0.0,
                             child: Container(
                               padding:EdgeInsets.all(8.0),
                               decoration:BoxDecoration(
                                 color:Color(0xFFE3F2FD).withOpacity(1),
                               ),
                               child:Column(
                                 children: [
                                   const SmallText( text: 'total',),
                                   SmallText(text:'${cartHistoryNum[i]} items')
                                 ],
                               )
                             ),
                           ),
                           const Positioned(
                             right:0,
                             bottom:0.0,
                             child: Icon(
                               Icons.arrow_forward_ios,
                             )
                           ),
                         ],
                         )
                       ]
                   )
               )
                   ]
               ),
             ),
           ),
         ],
       )
    );
  }
}
