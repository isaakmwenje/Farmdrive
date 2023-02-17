import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Farmdrive/controller/farmer_controller.dart';
import 'package:Farmdrive/data/crop_data.dart';
import 'package:Farmdrive/presentation/pages/home/select_farmer.dart';
import 'package:Farmdrive/presentation/widget/reusable_widget/big_text.dart';
import 'package:Farmdrive/presentation/widget/reusable_widget/small_text.dart';

import '../../../data/product_model.dart';

class VegetablesFarmersSearch extends StatelessWidget {
  ProductModel crop;
  double leftPadding;
  VegetablesFarmersSearch({Key? key, required this.crop,required this.leftPadding,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return      GetBuilder<FarmerController>(
      builder: (farmerController) {
        return Row(
          children: [
            Container(
                margin:EdgeInsets.only(left:leftPadding,top:16.0,bottom:16.0),
                height:200,
                decoration:BoxDecoration(
                     color:Colors.white,
                     borderRadius:BorderRadius.circular(10),
                    border:Border.all(
                      color:Colors.black12,
                      width:1.5,
                    )
                ),
                child:Row(
                    children:[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children:[
                              SizedBox(
                                height:50,
                                width:190,
                                child: GestureDetector(
                                  onTap:(){
                                    //Get.to(()=>SelectFarmer(crop: crop));
                                  },

                                  child: Container(
                                    alignment: Alignment.center,
                                    margin:const EdgeInsets.only(top:8.0,bottom:4.0),
                                    height:30,
                                    width:160,
                                    decoration:BoxDecoration(
                                        color:Colors.lightBlueAccent,
                                        borderRadius:BorderRadius.circular(8.0),
                                        border:Border.all(
                                          color:Colors.lightBlueAccent,
                                        )
                                    ),
                                    child : BigText(text:'select farmer',size:18,),
                                  ),
                                ),
                              ),
                              Row(children:[
                                SizedBox(
                                  height:50,
                                  width:110,
                                  child: Stack(
                                    children: [
                                      Container(
                                        alignment:Alignment.centerLeft,
                                        margin:EdgeInsets.only(top:8.0),
                                        height:30,
                                        width:80,
                                        decoration:BoxDecoration(
                                            color:Color(0xFFE3F2FD),
                                            borderRadius:BorderRadius.circular(8.0),
                                            border:Border.all(
                                              color:Colors.lightBlueAccent,
                                            )
                                        ),
                                        child:const TextField(
                                            decoration:InputDecoration(
                                              hintText:'location',
                                            )
                                        ),
                                      ),
                                      Positioned(
                                        right:0,
                                        top:2,
                                        child: Container(
                                            height:40,
                                            width:60,
                                            decoration:BoxDecoration(
                                                color:const Color(0xFFE3F2FD),
                                                shape:BoxShape.circle,
                                                border:Border.all(
                                                  color:Colors.lightBlueAccent,
                                                )
                                            ),
                                            child:const Icon(
                                              Icons.location_on,
                                            )
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height:50,
                                  width:90,
                                  child: Stack(
                                    children: [
                                      Container(
                                        margin:const EdgeInsets.only(top:8.0),
                                        height:30,
                                        width:60,
                                        decoration:BoxDecoration(
                                            color:const Color(0xFFE3F2FD),
                                            borderRadius:BorderRadius.circular(8.0),
                                            border:Border.all(
                                              color:Colors.lightBlueAccent,
                                            )
                                        ),
                                        child:const TextField(
                                            decoration:InputDecoration(
                                              hintText:'rating',
                                            )
                                        ),
                                      ),
                                      Positioned(
                                        right:0,
                                        top:2,
                                        child: Container(
                                            height:40,
                                            width:60,
                                            decoration:BoxDecoration(
                                                color:const Color(0xFFE3F2FD),
                                                shape:BoxShape.circle,
                                                border:Border.all(
                                                  color:Colors.lightBlueAccent,
                                                )
                                            ),
                                            child:const Icon(
                                              Icons.star,
                                            )
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                              ),
                              SizedBox(
                                height:50,
                                width:110,
                                child: Stack(
                                  children: [
                                    Container(
                                      margin:EdgeInsets.only(top:8.0),
                                      height:30,
                                      width:80,
                                      decoration:BoxDecoration(
                                          color:const Color(0xFFE3F2FD),
                                          borderRadius:BorderRadius.circular(8.0),
                                          border:Border.all(
                                            color:Colors.lightBlueAccent,
                                          )
                                      ),
                                      child:const TextField(
                                          decoration:InputDecoration(
                                            hintText:'favorites',
                                          )
                                      ),
                                    ),
                                    Positioned(
                                      right:0,
                                      top:2,
                                      child: Container(
                                          height:40,
                                          width:60,
                                          decoration:BoxDecoration(
                                              color:const Color(0xFFE3F2FD),
                                              shape:BoxShape.circle,
                                              border:Border.all(
                                                color:Colors.lightBlueAccent,
                                              )
                                          ),
                                          child:const Icon(
                                            Icons.favorite_rounded,
                                          )
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ]
                        ),
                      ),

                    ]
                )
            ),
                Container(
                  height:200,
                  margin:const EdgeInsets.only(left:30),
                  padding:const EdgeInsets.only(top:8.0,left:30,right:16.0),
                  decoration:BoxDecoration(
                      color:Colors.white,
                    borderRadius:BorderRadius.circular(10),
                    border:Border.all(
                      color:Colors.black12,
                      width:1.5,
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width:50,
                            height:50,
                            decoration: BoxDecoration(
                              shape:BoxShape.circle,
                              border:Border.all(
                                color:Colors.black12,
                                  width:1.7,
                            )
                            ),
                            child:const Icon(Icons.person)
                          ),
                            const Positioned(
                              bottom:4,
                              right:4,
                              child: CircleAvatar(
                                radius:4,
                                backgroundColor: Colors.green,
                              ),
                            )
        ],
        ),
                  const SizedBox(height:12),
                  SmallText(text:Get.find<FarmerController>().getFarmerList(crop).length.toString()),
                  const SmallText(text:'farmers'),
                  const SizedBox(height:20),
                  Padding(
                    padding: const EdgeInsets.only(left:4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        SizedBox(
                          width:70,
                          child: farmerController.getFarmer(crop) == null? const Text(
                            'username',
                            style: TextStyle(
                              fontSize:16,
                              fontWeight:FontWeight.w600,
                              color:Color(0xDD000000),
                            ),
                            overflow: TextOverflow.clip,
                          ):Text(
                            farmerController.getFarmer(crop)!.name!,
                            style: const TextStyle(
                              fontSize:16,
                              fontWeight:FontWeight.w600,
                              color:Color(0xDD000000),
                            ),
                            overflow: TextOverflow.clip,
                          ),
                        )
                      ]
                    ),
                  )
             ],
          ),
        )
          ],
        );
      }
    );
  }
}
