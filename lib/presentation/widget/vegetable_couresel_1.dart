import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Farmdrive/presentation/pages/vegetables_page.dart';
import 'package:Farmdrive/presentation/widget/reusable_widget/big_text.dart';
import 'package:Farmdrive/presentation/widget/reusable_widget/small_text.dart';

import '../../controller/popular_product_controller.dart';
import '../../data/product_model.dart';
import '../../utilities/AppConstants.dart';
import '../../utilities/dimensions.dart';

class VegetableCouresel extends StatelessWidget {
  List? displayList;
  FocusNode? focusNode;
  VegetableCouresel({Key? key,this.displayList,this.focusNode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    focusNode?.unfocus();
    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom:Dimensions.height4*4,left:Dimensions.width10*3,right: Dimensions.width4*2),
              child: Row(
                  mainAxisAlignment : MainAxisAlignment.spaceBetween,
                  children:  [
                    BigText(text:displayList!.isEmpty?'Vegetables':'Search result',size:18),
                    const Icon(
                    Icons.arrow_forward_ios,
                    color:Colors.black,
                    size:12,
                  ),
               ],
              ),
            ),
            SizedBox(
              height:Dimensions.height10*16,
              child: GetBuilder<PopularProductController>(
                builder: (popularProductController) {
                  return ListView.builder(
                    scrollDirection:Axis.horizontal,
                    itemCount: displayList!.isEmpty ?popularProductController.popularProductList.length:displayList!.length,
                    itemBuilder:(context,index){
                     ProductModel vegetable = displayList!.isEmpty ?popularProductController.popularProductList[index]:displayList![index];
                      return GestureDetector(
                        onTap:(){
                          Get.to(()=>VegetablesPage(crop: vegetable,));
                        },
                        child: Column(
                          children: [
                            SizedBox(height:Dimensions.height10),
                            Container(
                              margin:EdgeInsets.only(right:Dimensions.width10),
                              height:Dimensions.height10*14,
                              width:Dimensions.width10*16,
                              decoration: BoxDecoration(
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
                                  color:Colors.white,
                                ),
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:[
                                  ClipRRect(
                                    borderRadius:const BorderRadius.only(
                                      topLeft:Radius.circular(20),
                                      topRight:Radius.circular(20),
                                    ),
                                    child: Image(
                                      image: NetworkImage(
                                        AppConstants.BASE_URL+AppConstants.UPLOADS+vegetable.thumbnail!,
                                      ),
                                      height:Dimensions.height10*7,
                                      width:Dimensions.width10*16,
                                      fit:BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Container(
                                          height:Dimensions.height10*7,
                                          width:Dimensions.width10*16,
                                          color: Colors.grey[100],
                                        );
                                      },
                                    )
                                  ),
                                Padding(
                                  padding:EdgeInsets.only(left:Dimensions.width12,bottom:Dimensions.height6,top:Dimensions.height18),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:[
                                      BigText(text:vegetable.kind!,size:16),
                                      SizedBox(height:Dimensions.height4/2),
                                      RichText(
                                        text:TextSpan(
                                            text:'KES${vegetable.price}',
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
                                      )                                    ]
                                  ),
                                )
                                ]
                              )

                            ),
                          ],
                        ),
                      );
                    }
                  );
                }
              )
           )
          ],
        ),
      ],
    );
  }
}