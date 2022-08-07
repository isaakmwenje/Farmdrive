import 'package:flutter/material.dart';
import 'package:untitled3/data/order_data.dart';

class OrdersCaoresel extends StatefulWidget {
  const OrdersCaoresel({Key? key}) : super(key: key);

  @override
  _OrdersCaoreselState createState() => _OrdersCaoreselState();
}

class _OrdersCaoreselState extends State<OrdersCaoresel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:900,
      child: ListView.builder(
        shrinkWrap:true,
        scrollDirection:Axis.vertical,
        itemCount:orders.length,
          itemBuilder:(context,index){
          Order order = orders[index];
          return Column(
            children:[
              Container(
                padding:const EdgeInsets.symmetric(horizontal:8,vertical:4),
                decoration:BoxDecoration(
                boxShadow:const[
                BoxShadow(
                color:Colors.black12,
                blurRadius:2,
                offset:Offset(1,1),
                ),
                BoxShadow(
                color:Colors.black12,
                blurRadius:2,
                offset:Offset(-1,-1)
                )
                ],
                borderRadius:BorderRadius.circular(8),
                color:Colors.greenAccent[100],
          ),
                child:const Text(
                  'today',
                  style:TextStyle(
                    color:Colors.black54,
                    fontSize:16,
                  )
                )
              ),
              Stack(
                children:[
                  Container(
                      height:170,
                      width:double.maxFinite,
                      padding:const EdgeInsets.all(6.0),
                      margin:const EdgeInsets.symmetric(horizontal:10.0),
                      decoration:BoxDecoration(

                        color:Colors.white,
                        borderRadius:BorderRadius.circular(15),
                      ),
                      child:Column(
                          children:[
                            Row(
                                mainAxisSize:MainAxisSize.min,
                                children:[
                                  const Text(
                                    'ORDER ID',
                                    style: TextStyle(
                                      color:Colors.black,
                                      fontSize:20,
                                      letterSpacing:1.4,
                                    ),
                                  ),
                                  const SizedBox(width:15),
                                  Text(
                                      order.orderId,
                                      style:const TextStyle(
                                        color:Colors.black,
                                        fontSize:20,
                                        letterSpacing:1.4,
                                      )
                                  ),
                                  const  Text(
                                      ' from',
                                      style:TextStyle(
                                        color:Colors.black,
                                        fontSize:20,
                                        letterSpacing:1.4,
                                      )
                                  ),
                                  const SizedBox(width: 15,),
                                  Expanded(
                                    child: Container(
                                        padding:const EdgeInsets.symmetric(horizontal:4,vertical:4.0),
                                        decoration:BoxDecoration(
                                            borderRadius:BorderRadius.circular(8),
                                            color:Colors.black12,
                                            boxShadow:const [
                                              BoxShadow(
                                                  color:Colors.black12,
                                                  offset:Offset(1,1)
                                              ),
                                              BoxShadow(
                                                  color:Colors.black12,
                                                  offset:Offset(-1,-1)
                                              )
                                            ]
                                        ),
                                        child:Text(
                                          order.farmer.name,
                                          style:const TextStyle(
                                            color:Colors.white,
                                            fontSize:20,
                                            letterSpacing:1.4,
                                          ),
                                          overflow:TextOverflow.ellipsis,
                                          maxLines:1,
                                        )
                                    ),
                                  ),
                                  const SizedBox(width:20),
                                ]
                            ),
                            Row(
                                children: [
                                  const Text(
                                      'total amount is',
                                      style:TextStyle(
                                        color:Colors.black,
                                        fontSize:20,
                                        letterSpacing:1.4,
                                      )
                                  ),
                                  const SizedBox(width:10),
                                  Text(
                                      'Ksh ${order.amount}',
                                      style:const TextStyle(
                                          color:Colors.black,
                                          fontSize:24,
                                          decoration:TextDecoration.underline
                                      )
                                  ),
                                  const SizedBox(width:10),
                                ]
                            ),
                            Row(
                              children: [
                                const Text(
                                  'payment means',
                                  style:TextStyle(
                                    color:Colors.black,
                                    fontSize:20,
                                    letterSpacing:1.4,
                                  )
                                ),
                                const SizedBox(width: 6.0,),
                                const Text(
                                  'on delivery',
                                  style: TextStyle(
                                      color:Colors.black,
                                      fontSize:24,
                                      decoration:TextDecoration.underline
                                  )
                                ),
                                const SizedBox(width:6.0),
                                Text(
                                    order.time,
                                    style:const TextStyle(
                                      color:Colors.black54,
                                      fontSize:18,
                                      letterSpacing:1.2,
                                    )
                                )
                              ],
                            ),
                            const Divider(
                              color:Colors.black54,
                              thickness:1,
                              indent:13,
                              endIndent:13,
                            ),
                            TextButton(
                              onPressed:(){},
                              child:const Text(
                                'EXPAND',
                                style:TextStyle(
                                  color:Colors.black,
                                  fontWeight:FontWeight.bold,
                                  fontSize:18,
                                  letterSpacing:1.5,
                                )
                              )
                            )
                          ]
                      )
                  ),
                  const Positioned(
                    right:0,
                    bottom:115,
                    child: CircleAvatar(
                      backgroundColor:Colors.green,
                      radius:20,
                    ),
                  )
            ]
              ),

            ]
          );
        }
      ),
    );
  }
}
