import 'package:flutter/material.dart';
import 'package:Farmdrive/controller/cart_controller.dart';
import 'package:Farmdrive/data/cart_model.dart';
import 'package:Farmdrive/presentation/widget/reusable_widget/big_text.dart';
import 'package:Farmdrive/presentation/widget/reusable_widget/small_text.dart';
import 'package:get/get.dart';
import 'package:Farmdrive/utilities/FormatDates.dart';
import 'package:intl/intl.dart';

import '../../utilities/AppConstants.dart';
import '../../utilities/color_constants.dart';
import '../../utilities/dimensions.dart';

class CartHistory extends StatefulWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  _CartHistoryState createState() => _CartHistoryState();
}

class _CartHistoryState extends State<CartHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       body:Column(
         children: [
           Container(
             alignment:Alignment.bottomCenter,
             height:Dimensions.height100,
             width:double.infinity,
             color:Colors.white,
             child:Column(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children:[
                       SizedBox(width:Dimensions.width12),
                       GestureDetector(
                         onTap:(){
                           Navigator.of(context).pop();
                         },
                           child: Icon(Icons.arrow_back_ios,color:Colors.black,size:18)),
                     BigText(size:18,text:'Cart History',color:Colors.black,),
                     SizedBox(width:Dimensions.width4),
                   ]
                 ),
                 SizedBox(height:Dimensions.height10),
               ],
             )
           ),
           Expanded(
             child: MediaQuery.removePadding(
               removeTop:true,
               context: context,
               child: GetBuilder<CartController>(
                 builder: (cartController) {
                   int counter = 0;
                   List<Cart> cartHistoryList = cartController.getCartHistory().reversed.toList();
                   var cartHistoryMap = Map();

                   for(int i=0;i<cartHistoryList.length;i++){
                     if(cartHistoryMap.containsKey(getDate(cartHistoryList[i].time))){
                       cartHistoryMap.update(getDate(cartHistoryList[i].time),(value)=>++value);
                     }else{
                       cartHistoryMap.putIfAbsent(getDate(cartHistoryList[i].time), () => 1);
                     }
                   }

                   List cartHistoryNum = cartHistoryMap.entries.map((e) => e.value).toList();
                   return cartHistoryMap.isNotEmpty?ListView(
                       children:[
                         for(int i=0;i<cartHistoryMap.length;i++)
                       Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children:[
                             Container(
                                 margin:EdgeInsets.only(left:Dimensions.width20,top:Dimensions.height16,bottom:Dimensions.height16/2),
                                 padding:EdgeInsets.symmetric(horizontal:Dimensions.width12,vertical:Dimensions.height6),
                                 decoration: BoxDecoration(
                                   color:const Color(0xFFE3F2FD),
                                   borderRadius:BorderRadius.circular(6.0),
                                 ),
                                 child:  SmallText(text:getDate(cartHistoryList[counter].time))),
                             Stack(children:[
                               SizedBox(
                                   height:Dimensions.height100,
                                   child:Padding(
                                     padding: EdgeInsets.only(right:Dimensions.width30*2),
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
                                                   margin:EdgeInsets.only(left:Dimensions.width4*2,top:Dimensions.height4),
                                                   height:Dimensions.height100,
                                                   width:Dimensions.width100,
                                                   decoration:BoxDecoration(
                                                   borderRadius:BorderRadius.circular(3),
                                                   border:Border.all(
                                                   color:Colors.black12,
                                                 ),
                                                 image:DecorationImage(
                                                   fit:BoxFit.cover,
                                                   image:NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOADS+cartHistoryList[counter-1].image)
                                                 )
                                                 )
                                                 ),
                                                 Positioned(
                                                   bottom:Dimensions.height4/2,
                                                   right:0,
                                                   child: Container(
                                                     padding:EdgeInsets.symmetric(horizontal:Dimensions.width4,vertical:Dimensions.height4/2),
                                                     decoration:BoxDecoration(
                                                       color:AppColors.backgroundColor,
                                                       borderRadius:const BorderRadius.only(
                                                         topLeft:Radius.circular(8.0),
                                                         bottomLeft:Radius.circular(8.0)
                                                       )
                                                     ),
                                                     child:SmallText(text:DateFormat('hh:mm a').format(dateTime),color: Colors.black38,
                                                     )),
                                                   ),

                                               ]
                                           );
                                         })
                                     ),
                                   )
                               ),
                              Positioned(
                                top:0,
                                right:0,
                                child: Container(
                                    padding:const EdgeInsets.all(8.0),
                                    decoration:BoxDecoration(
                                      color:const Color(0xFFE3F2FD).withOpacity(1),
                                    ),
                                    child:Column(
                                      children: [
                                        const SmallText( text: 'Total',),
                                        SmallText(text:'${cartHistoryNum[i]} items')
                                      ],
                                    )
                                ),
                              ),
                             const  Positioned(
                                bottom: 0,
                                right:0,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                ),
                              )
                             ],
                             )
                           ]
                       )
                       ]
                   ):Column(
                     mainAxisAlignment:MainAxisAlignment.center,
                   children: [

                   Stack(
                         children: [
                         Image(
                         height:200,
                         width:300,
                         image: AssetImage('assets/logo/cart.jpg'),
                   ),
                   Positioned(
                           bottom:0,
                           left:0,
                           right:0,
                           child:Container(
                             height:Dimensions.height10*2,
                             color:Colors.white,
                           )
                   ),
                   ],
           ),
                     SizedBox(height:40),
                     SmallText(text:'Buy an item to add to cart history',size:18),
           SizedBox(
             height:Dimensions.height4,
           ),
                     SmallText(text:'Cart History is Empty!!',size:18),
           SizedBox(
             height:Dimensions.height100+Dimensions.height40/2,
           )
         ]
       );
                 }
               ),
             ),
           ),
         ],
       )
    );
  }
}
