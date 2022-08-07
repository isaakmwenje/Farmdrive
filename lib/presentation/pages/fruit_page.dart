

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:untitled3/controller/cart_controller.dart';
import 'package:untitled3/controller/farmer_controller.dart';
import 'package:untitled3/controller/product_controller.dart';
import 'package:untitled3/data/cart_model.dart';
import 'package:untitled3/data/crop_data.dart';
import 'package:untitled3/data/fruit_data.dart';
import 'package:untitled3/presentation/widget/reusable_widget/big_text.dart';
import 'package:untitled3/presentation/widget/reusable_widget/expandable_widget_paragraphs.dart';
import 'package:untitled3/presentation/widget/reusable_widget/small_text.dart';
import 'package:untitled3/presentation/widget/vegetable_page_widget/vegetable_farmers_search_couresel.dart';

import 'cart_page.dart';

class FruitPage extends StatelessWidget {
  Crop crop ;
  FruitPage({Key? key,required this.crop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<ProductController>();
    product.initProduct(Get.find<CartController>(),crop);
    return Scaffold(
      backgroundColor:const Color(0xFFE3F2FD),
      body:Stack(
        children:[
          Positioned(
            left:0,
            right:0,
            child: Container(
                margin:const EdgeInsets.all(8.0),
                decoration:const BoxDecoration(
                    borderRadius:BorderRadius.only(
                      topLeft:Radius.circular(30),
                      topRight:Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color:Colors.black12,
                        offset: Offset(2,2),
                      ),
                      BoxShadow(
                        color:Colors.black12,
                        offset:Offset(-2,-2),
                      )
                    ]
                ),
                child:ClipRRect(
                  borderRadius:const BorderRadius.only(
                    topLeft:Radius.circular(30),
                    topRight:Radius.circular(30),
                  ),
                  child: Image(
                    image:AssetImage(crop.image),
                    height:300,
                    width:double.infinity,
                    fit:BoxFit.cover,
                  ),
                )
            ),
          ),
          Positioned(
            right:0,
            left:0,
            top:280,
            bottom:0,
              child:Container(
                margin:const EdgeInsets.all(8.0),
                decoration:const BoxDecoration(
                  color: Color(0xFFE3F2FD),
                borderRadius:BorderRadius.only(
                  topRight:Radius.circular(30),
                  topLeft:Radius.circular(30),
                )
              ),
              child:ClipRRect(
                  borderRadius:const BorderRadius.only(
                    topRight:Radius.circular(30),
                    topLeft:Radius.circular(30),
                  ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Center(child: BigText(text:crop.type)),
                      Padding(
                        padding: const EdgeInsets.only(left:24.0),
                        child: BigText(text:'introduce',size:18),
                      ),
                      ExpandedParagraph(text:'Although bananas are commonly thought to contain exceptional potassium content,[27][118] their actual potassium content is not high per typical food serving, having only 8% of the US recommended Daily Value for potassium (considered a low level of the DV, see nutrition table), and their potassium-content ranking among fruits, vegetables, legumes, and many other foods is relatively moderate.[119][120] Vegetables with higher potassium content than raw dessert bananas (358 mg per 100 g) include raw spinach (558 mg per 100 g), baked potatoes without skin (391 mg per 100 g), cooked soybeans (539 mg per 100 g), grilled portabella mushrooms (437 mg per 100 g), and processed tomato sauces (413–439 mg per 100 g). Raw plantains contain 499 mg potassium per 100 g. Dehydrated dessert bananas or banana powder contain 1491 mg potassium per 100 g.[119]'),
                      Row(
                        children: [
                          VegetablesFarmersSearch(leftPadding: 0.0,crop:crop),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            )
          ),
          const Positioned(
            top:260,
            right:30,
            child:Icon(Icons.favorite_border),
          ),
           Positioned(
            top:60,
            left:10,
            child:InkWell(
                onTap:(){
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back))
          ),
          Positioned(
            top:60,
            right:10,
            child:InkWell(
              onTap:(){
                  if(product.getQuantity(crop) >= 1){
                    Get.to(()=>  const CartPage());
                  }

              },
              child:Stack(
                children:[
                  Container(
                      padding:const EdgeInsets.all(12.0),
                      decoration: const BoxDecoration(
                        color:Color(0xFFE3F2FD),
                        shape:BoxShape.circle,
                      ),
                      child:const  Icon(Icons.shopping_cart,color:Colors.black)),
                  Positioned(
                    top:0,
                    left:28,
                    child:GetBuilder<ProductController>(
                      builder: (product) {
                        return Get.find<ProductController>().getQuantity(crop) >=1 ?SmallText(text:product.inCartItem.toString()):const SizedBox.shrink();
                      }
                    ),)
                ]
              )
            )
          )
        ]
      ),
      bottomNavigationBar:Container(
        margin:const EdgeInsets.all(8.0),
        height:120,
        decoration:BoxDecoration(
          color:Colors.black.withOpacity(0.1),
          borderRadius:BorderRadius.circular(60),
        ),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[
            Container(
              height:60,
              width:120,
              decoration:BoxDecoration(
                color:Colors.white,
                borderRadius:BorderRadius.circular(20),
              ),
              child:GetBuilder<ProductController>(
                builder: (product) {
                  return Row(
                    mainAxisAlignment:MainAxisAlignment.spaceAround,
                    children:[
                      Column(
                        children: [
                          const SizedBox(height:10.0),
                          GestureDetector(
                              onTap:(){
                                product.setQuantity(false);
                              },
                              child: Icon(Icons.minimize)),
                        ],
                      ),
                      BigText(text: product.inCartItems.toString(),),
                      GestureDetector(
                          onTap:(){
                            product.setQuantity(true);
                          },
                          child: Icon(Icons.add))
                    ]
                  );
                }
              )
            ),
            GestureDetector(
              onTap:(){
                final farmer = Get.find<FarmerController>().getFarmer(crop);
                product.addItem(farmer:farmer,crop:crop);
              },
              child: Container(
                  height:60,
                  width:210,
                  decoration:BoxDecoration(
                    color:Colors.lightBlueAccent[700],
                    borderRadius:BorderRadius.circular(20),
                  ),
                  child:Row(
                     children:[
                       BigText(text:'KES'+crop.price.toString()+"| "),
                       BigText(text:'Add to cart')
                     ]
                  )
              ),
            )
          ]
        )
      )
    );
  }
}
