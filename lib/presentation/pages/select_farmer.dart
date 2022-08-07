import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:untitled3/controller/farmer_controller.dart';
import 'package:untitled3/data/crop_data.dart';
import 'package:untitled3/data/farmer_data.dart';
import 'package:untitled3/presentation/widget/reusable_widget/big_text.dart';
import 'package:untitled3/presentation/widget/reusable_widget/small_text.dart';

class SelectFarmer extends StatelessWidget {
  Crop crop;
  SelectFarmer({Key? key,required this.crop}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children:[
          Positioned(
            left:0,
            right: 0,
            child:Container(
              alignment:Alignment.bottomCenter,
              height:130,
              width:double.maxFinite,
              color:Colors.blue,
              child:Row(
                children:[
                  IconButton(
                    icon:Icon(Icons.arrow_back,color:Colors.white),
                    onPressed:(){
                      Navigator.pop(context);

                    },
                  ),
                  SizedBox(width:20),
                  BigText(text:'select farmer',color:Colors.white),
                ]
              )
            )
          ),
          Positioned(
            bottom:630,
            right:10,
            child:Container(
              decoration:const BoxDecoration(
                color:Colors.yellow,
                boxShadow:[
                  BoxShadow(
                    offset:Offset(1,1),
                    color:Colors.black12,
                    blurRadius:2,
                  ),
                  BoxShadow(
                    offset:Offset(-1,-1),
                    color:Colors.black12,
                    blurRadius:2,
                  ),
                ],
                shape:BoxShape.circle,
              ),
                child:CircleAvatar(
                  radius:30,
                  backgroundImage:AssetImage(
                    crop.image,
                  ),
                )
            )
          ),
          Positioned(
            left:0,
            right:0,
            top:160,
            bottom:0,
            child:GetBuilder<FarmerController>(
              builder: (farmerController) {
                List vegetableFarmers = farmerController.getFarmerList(crop);
                return Column(
                    children: [
                      Row(
                          children:[
                            Container(
                                width:190,
                                margin:EdgeInsets.only(left:20),
                                padding: EdgeInsets.all(6.0),
                                alignment: Alignment.centerLeft,
                                decoration:BoxDecoration(
                                  color:Colors.white,
                                  boxShadow:const [
                                    BoxShadow(
                                      offset:Offset(1,1),
                                      color:Colors.lightBlueAccent,
                                      blurRadius:6,
                                    ),
                                    BoxShadow(
                                      offset:Offset(-1,-1),
                                      color:Colors.lightBlueAccent,
                                      blurRadius:6,
                                    ),
                                  ],
                                  borderRadius:BorderRadius.circular(10.0),
                                ),
                                child:Icon(Icons.search_rounded)
                            ),
                            SizedBox(width:50),
                            Container(
                                padding:EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  color:Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child:Row(
                                    children: [
                                      const Icon(
                                        Icons.person,
                                      ),
                                      SmallText(text:vegetableFarmers.length.toString())
                                    ]
                                )
                            )
                          ]
                      ),
                      Expanded(
                        child:MediaQuery.removePadding(
                          removeTop:true,
                          context: context,
                          child: ListView(
                                children:vegetableFarmers.map((farmer){
                                  final checkBox = farmerController.checkFarmer(farmer);
                                  print(checkBox);
                                  return FarmersColumnWidget(
                                   checkBox:farmerController.checkFarmer(farmer),
                                    vegetableFarmer: farmer,
                                    onSelectFarmer:farmerController.setFarmer, crop: crop,
                                  );
                                }).toList(),
                              )
                        )
                      )

                    ]
                );
              }
            )
          )

        ]
      )
    );
  }
}


class FarmersColumnWidget extends StatelessWidget {
  final Farmer vegetableFarmer;
  final Function onSelectFarmer;
  final bool checkBox;
  final Crop? crop;
  const FarmersColumnWidget({Key? key,required this.crop,required this.vegetableFarmer,required this.onSelectFarmer,required this.checkBox}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top:16.0,left:10.0,right:12.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Row(
                        children:[
                          BigText(text:vegetableFarmer.name),
                          SizedBox(width:20),
                          Row(
                              children:[
                                const Icon(Icons.location_on,size:18),
                                SmallText(text: vegetableFarmer.location),
                              ]
                          ),

                        ]
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                            ignoreGestures:true,
                            initialRating:vegetableFarmer.rating,
                            onRatingUpdate: (rating){},
                            itemSize:20,
                            itemBuilder:(context,_){
                              return const Icon(Icons.star,color:Colors.amber);
                            }
                        ),
                        const SizedBox(width:18),
                        Text(
                            vegetableFarmer.rating.toString(),
                            style: const TextStyle(
                              fontSize:18,
                              fontWeight:FontWeight.w400,
                            )
                        )
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap:()=>onSelectFarmer(vegetableFarmer,crop:crop),
                  child: Container(
                    alignment:Alignment.center,
                    height:16,
                    width:18,
                    decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(2),
                        border:Border.all(
                          color:Colors.black45,
                        )
                    ),
                    child:checkBox?const Icon(
                      Icons.check,size:20,
                    ):const SizedBox(),
                  ),
                )
              ]
          ),
        )
      ],
    );
  }
}

