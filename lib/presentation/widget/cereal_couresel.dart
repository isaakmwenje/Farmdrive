import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:Farmdrive/presentation/pages/cereal_page.dart';
import 'package:Farmdrive/presentation/widget/reusable_widget/big_text.dart';
import 'package:Farmdrive/presentation/widget/reusable_widget/small_text.dart';

import '../../controller/cereals_controller.dart';
import '../../data/product_model.dart';
import '../../utilities/AppConstants.dart';
import '../../utilities/dimensions.dart';

class CerealCouresel extends StatefulWidget {
  const CerealCouresel({Key? key}) : super(key: key);

  @override
  _CerealCoureselState createState() => _CerealCoureselState();
}

class _CerealCoureselState extends State<CerealCouresel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(
            left: Dimensions.width10*3,top:Dimensions.height10*2,right: 8.0,bottom:Dimensions.height4*2,
          ),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              BigText(text:'Cereals',size:18),
              Icon(
                Icons.arrow_forward_ios,
                size:12,
              )
            ]
          ),
        ),
        SizedBox(
          height: Dimensions.height120*2,
          child: GetBuilder<CerealsController>(
            builder: (cerealsController) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:cerealsController.cerealsList.length,
                itemBuilder:(context,index){
                  ProductModel crop = cerealsController.cerealsList[index];
                  return GestureDetector(
                    onTap:(){
                     Get.to(() => CerealPage(crop:crop));
                    },
                    child : Column(
                      children: [
                        SizedBox(height: Dimensions.height4*2,),
                        Container(
                            margin:  EdgeInsets.only(right:Dimensions.width10),
                              height:Dimensions.height100*2+Dimensions.height10,
                            width:Dimensions.width10*15,
                              decoration: BoxDecoration(
                                color:Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color:Colors.grey[100]!,
                                    offset:Offset(-1,-1),
                                    blurRadius:1,
                                    spreadRadius:1,
                                  ),
                                  BoxShadow(
                                    color:Colors.grey[100]!,
                                    offset:Offset(-1,-1),
                                    blurRadius:1,
                                    spreadRadius:1,
                                  ),
                                ],
                                borderRadius:BorderRadius.circular(20),
                              ),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                               decoration:const BoxDecoration(
                               border:Border(
                                 bottom:BorderSide(
                                   color:Colors.black12,
                                   width:1.0,
                                 )
                               ),
                          ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                topLeft:Radius.circular(20),
                                 topRight: Radius.circular(20),
                          ),
                                  child: Image(
                                    width:Dimensions.width10*16,
                                    height:Dimensions.height10*14,
                                    image: NetworkImage(AppConstants.BASE_URL +AppConstants.UPLOADS + crop.thumbnail!),
                                    fit:BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        height:Dimensions.height10*14,
                                        width:Dimensions.width10*16,
                                        color: Colors.grey[100],
                                      );
                                    },
                                  ),
                                ),
                              ),
                  Padding(
                  padding:  EdgeInsets.only(left:Dimensions.width12,),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                  BigText(text:crop.kind!,size:16),
                        SizedBox(height:Dimensions.height4/2),
                        SmallText(text:'By weight',color:Colors.black38),
                        RichText(
                        text:TextSpan(
                            text:'KES${crop.price}',
                            style:const TextStyle(
                              fontWeight:FontWeight.w500,
                              color:Colors.black,
                              fontSize:16,
                            ),
                            children:const [
                               TextSpan(
                                  text:'/kg',
                                  style:TextStyle(
                                    color:Colors.black38,
                                    fontSize:16,
                                  )
                              )
                            ]
                        ),
                  )

                  ])
                  )]),
                  ),
                      ],
                    ));
                }
              );
            }
          )
        )
      ]
    );
  }
}


