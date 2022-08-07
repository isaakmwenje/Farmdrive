import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:untitled3/controller/cart_controller.dart';
import 'package:untitled3/controller/farmer_controller.dart';
import 'package:untitled3/controller/product_controller.dart';
import 'package:untitled3/data/cereal_data.dart';
import 'package:untitled3/data/crop_data.dart';
import 'package:untitled3/presentation/screen/nav_screen.dart';
import 'package:untitled3/presentation/widget/reusable_widget/big_text.dart';
import 'package:untitled3/presentation/widget/reusable_widget/expandable_widget.dart';
import 'package:untitled3/presentation/widget/reusable_widget/small_text.dart';
import 'package:untitled3/presentation/widget/vegetable_page_widget/vegetable_farmers_search_couresel.dart';
import 'cart_page.dart';

class CerealPage extends StatelessWidget {
  Crop crop;
  CerealPage({Key? key,required this.crop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<ProductController>();
    product.initProduct(Get.find<CartController>(),crop);
    return Scaffold(
      backgroundColor:Colors.white,
      body:CustomScrollView(
        slivers:[
          SliverAppBar(
            backgroundColor:Colors.white,
            pinned:true,
            expandedHeight:200,
            flexibleSpace:FlexibleSpaceBar(
              background:Image(
                image:AssetImage(
                  crop.image,
                ),
                width:double.maxFinite,
                fit:BoxFit.cover,
              )
            ),
            actions:[
              GestureDetector(
                onTap:(){
                  if(product.getQuantity(crop) >= 1){
                    Get.to(()=>  const CartPage());
                  }
                },
                child: Stack(
                  children: [
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
                      child:  GetBuilder<ProductController>(
                          builder: (product) {
                            return Get.find<ProductController>().getQuantity(crop)>=1?SmallText(text: product.inCartItem.toString(),):SizedBox.shrink();
                          }
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(width:6.0),
            ],
            leading:InkWell(
              onTap:(){
                Get.to(()=>NavScreen());
              },
              child: Icon(Icons.arrow_back,color:Colors.black,),
            ),
            bottom:PreferredSize(
              preferredSize: Size.fromHeight(20),
              child:Container(
                alignment: Alignment.center,
                width:double.infinity,
                decoration:const BoxDecoration(
                  color:Colors.white,
                  borderRadius:BorderRadius.only(
                    topLeft:Radius.circular(16),
                    topRight:Radius.circular(16),
                  )
                ),
                  child: BigText(text:crop.type)),
            ),
          ),
         SliverToBoxAdapter(
           child:Column(
             children:[
               ExpandableWidget(text1:'how to prepare',text2:"Highly Nutritious and Particularly Rich in Vitamin A. ",text3:'Highly Nutritious and Particularly Rich in Vitamin A. ',text5:'healthy benefits',text6:'Highly Nutritious and Particularly Rich in Vitamin A.'),
               Row(
                 children: [
                   VegetablesFarmersSearch(crop:crop,leftPadding:16.0),
                 ],
               ),
               GetBuilder<ProductController>(
                 builder: (products) {
                   return Row(
                     mainAxisAlignment:MainAxisAlignment.center,
                     children: [
                       Column(
                         children:[
                           GestureDetector(
                               onTap:(){
                                 product.setQuantity(false);
                               },
                               child: Icon(Icons.minimize)),
                           SizedBox(height: 12,)
                         ],
                       ),
                       SizedBox(width:12.0),
                       Container(
                         padding:const EdgeInsets.only(left:24,),
                         height:50,
                         width:140,
                         decoration:BoxDecoration(
                             borderRadius:BorderRadius.circular(16.0),
                             color:Colors.white,
                             border:Border.all(
                               color:Colors.black12,
                             )
                         ),
                         child: Row(
                             children:[
                               BigText(text:'KES'+crop.price.toString()),
                               BigText(text:' x'),
                               BigText(text:product.inCartItems.toString()),
                             ]
                         ),
                       ),
                       const


                       SizedBox(width: 12,),
                       GestureDetector(
                           onTap:(){
                             product.setQuantity(true);
                           },
                           child: Icon(Icons.add))
                     ],
                   );
                 }
               ),
             ]
           )
         )
        ]
      ),
      bottomNavigationBar:Container(
          margin:const EdgeInsets.symmetric(horizontal:16.0,vertical:8.0),
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
                    width:80,
                    decoration:BoxDecoration(
                      color:Colors.white,
                      borderRadius:BorderRadius.circular(20),
                    ),
                    child:const Icon(
                      Icons.favorite_rounded,
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
                            BigText(text:'KES'+crop.price.toString()+'| '),
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
