import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Farmdrive/presentation/pages/fruit_page.dart';
import 'package:Farmdrive/presentation/widget/reusable_widget/big_text.dart';
import 'package:Farmdrive/presentation/widget/reusable_widget/small_text.dart';

import '../../controller/fruits_controller.dart';
import '../../data/product_model.dart';
import '../../utilities/AppConstants.dart';
import '../../utilities/dimensions.dart';

class FruitCouresel extends StatelessWidget {
  const FruitCouresel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(
          left: Dimensions.width10*3,
          top: Dimensions.height10,
          right: Dimensions.width4*2,
          bottom: Dimensions.height10,
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          BigText(text: 'Fruits', size: 18),
          Icon(
            Icons.arrow_forward_ios,
            size: 12,
          )
        ]),
      ),
      Container(
          padding: EdgeInsets.only(top: Dimensions.height10),
          height: Dimensions.height10 * 19,
          child: GetBuilder<FruitController>(builder: (fruitController) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: fruitController.fruitsList.length,
              itemBuilder: (context, index) {
                ProductModel crop = fruitController.fruitsList[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(() => FruitPage(crop: crop));
                  },
                  child: Stack(children: [
                    Container(
                      height: Dimensions.height10 * 14,
                      width: Dimensions.width10 * 16,
                      margin:  EdgeInsets.only(right:Dimensions.width10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[100]!,
                            offset: Offset(-1, -1),
                            blurRadius: 1,
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: Colors.grey[100]!,
                            offset: Offset(-1, -1),
                            blurRadius: 1,
                            spreadRadius: 1,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          image: NetworkImage(AppConstants.BASE_URL +
                              AppConstants.UPLOADS +
                              crop.thumbnail!),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height:Dimensions.height10*7,
                              width:Dimensions.width10*16,
                              color: Colors.grey[100],
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: Dimensions.height10 * 2,
                      left:0,
                      right:Dimensions.width10*2+Dimensions.width6,
                      child: Container(
                        width: Dimensions.width100*2,
                        height: Dimensions.height10*5,
                        margin: EdgeInsets.only(left:Dimensions.width10*2),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[100]!,
                              offset: Offset(-1, -1),
                              blurRadius: 1,
                              spreadRadius: 1,
                            ),
                            BoxShadow(
                              color: Colors.grey[100]!,
                              offset: Offset(-1, -1),
                              blurRadius: 1,
                              spreadRadius: 1,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(text: crop.kind!, size: 18),
                                SizedBox(height:Dimensions.height4/2),
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
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ]),
                );
              },
            );
          }))
    ]);
  }
}
