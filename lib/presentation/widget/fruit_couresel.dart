import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/data/fruit_data.dart';
import 'package:untitled3/presentation/pages/fruit_page.dart';

class FruitCouresel extends StatelessWidget {
  const FruitCouresel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Padding(
          padding: const EdgeInsets.only(left: 30,bottom:8.0,right:8.0,top:16.0),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children:const[
              Text(
                'fruits',
                style:TextStyle(
                 fontSize:20,
                 fontWeight:FontWeight.w500,
                 color:Colors.black54,
                  letterSpacing:1.5,
                ),
              ),
              Icon(
              Icons.arrow_forward_ios,
              color:Colors.black,
              size:20,
              )
            ]
          ),
        ),
        SizedBox(
          height:210,
          child: ListView.builder(
            scrollDirection:Axis.horizontal,
            itemCount:fruits.length,
            itemBuilder:(context,index){
              Fruit fruit = fruits[index];
              return GestureDetector(
                onTap:(){
                  Get.to(() =>FruitPage(crop:fruit));
                },
                child: Stack(
                  children:[
                    Container(
                      height:140,
                      width:170,
                      padding:const EdgeInsets.only(right:3.0),
                      margin:const EdgeInsets.only(left:20),
                      decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(20),
                        color:Colors.white,
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
                        ]
                      ),
                      child: ClipRRect(
                        borderRadius:BorderRadius.circular(20),
                        child: Image(
                          image:AssetImage(
                            fruit.image,
                          ),
                          fit:BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom:8,
                      left:45,
                      child: Container(
                      width:120,
                      height: 70.0,
                      decoration: BoxDecoration(
                         boxShadow:const[
                           BoxShadow(
                             color:Colors.black12,
                             offset:Offset(0,5),
                           ),
                           BoxShadow(
                             color:Colors.white,
                             offset:Offset(-5,0),
                           ),
                           BoxShadow(
                             color:Colors.white,
                             offset:Offset(5,0),
                           ),
                           BoxShadow(
                             color:Colors.black12,
                             offset:Offset(0,-1),
                             blurRadius:1,
                           )
                         ],
                         color : Colors.white,
                         borderRadius:BorderRadius.circular(20),
                         border:Border.all(
                           color:Colors.white,
                         ),
                      ),
                        child: Column(
                          children:[
                            Text(
                              fruit.type,
                              style:const TextStyle(
                                fontWeight:FontWeight.w500,
                                fontSize:18,
                              )
                            ),
                            Row(
                              mainAxisSize:MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               const Text(
                                 'price : ',
                                 style:TextStyle(
                                   fontSize: 18,
                                   fontWeight:FontWeight.bold,
                                 )
                               ),
                                Expanded(
                                  child: Text(
                                      '2 for '+(fruit.price * 2).toString()+'ksh',
                                    style:const TextStyle(
                                      fontSize:18,
                                      fontWeight:FontWeight.w400,
                                    )
                                  ),
                                )
                              ],
                            ),
                          ]
                        ),
                      ),
                    ),
                  ]
                ),
              );
            },
          )
        )
      ]
    );
  }
}
