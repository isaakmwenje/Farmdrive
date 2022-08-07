

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:untitled3/controller/cart_controller.dart';
import 'package:untitled3/controller/farmer_controller.dart';
import 'package:untitled3/controller/product_controller.dart';
import 'package:untitled3/data/crop_data.dart';
import 'package:untitled3/data/vegetable_data.dart';
import 'package:untitled3/presentation/screen/home_screen.dart';
import 'package:untitled3/presentation/screen/nav_screen.dart';
import 'package:untitled3/presentation/widget/reusable_widget/big_text.dart';
import 'package:untitled3/presentation/widget/reusable_widget/expandable_widget.dart';
import 'package:untitled3/presentation/widget/reusable_widget/small_text.dart';
import 'package:untitled3/presentation/widget/vegetable_page_widget/vegetable_farmers_search_couresel.dart';
import 'cart_page.dart';

class VegetablesPage extends StatelessWidget {
  Crop crop;
  VegetablesPage({Key? key,required this.crop}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var product = Get.find<ProductController>();
    product.initProduct(Get.find<CartController>(),crop);
    return Scaffold(
      body:GestureDetector(
        onTap:(){
          FocusScope.of(context).unfocus;
        },
        child: CustomScrollView(
          slivers:[
            SliverAppBar(
              bottom:PreferredSize(
                preferredSize:Size.fromHeight(20),
                child: Container(
                  width:MediaQuery.of(context).size.width-30,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE3F2FD),
                    borderRadius: BorderRadius.only(
                      topRight:Radius.circular(8),
                      topLeft:Radius.circular(8),
                    )
                  ),
                  child:BigText(text:crop .type),
        ),
              ),
              automaticallyImplyLeading: false,
              leading:InkWell(
                onTap:(){
                  Get.to(()=> const NavScreen());
                },
                child:const Icon(Icons.arrow_back_sharp,color:Colors.black),
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
                const SizedBox(width:10),
              ],
              backgroundColor: const Color( 0xFFE3F2FD),
              pinned:true,
              expandedHeight:240,
              flexibleSpace:FlexibleSpaceBar(
                background:Container(
                  margin:const EdgeInsets.all(8.0),
                  decoration:const BoxDecoration(
                    borderRadius:BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )
                  ),
                  child: ClipRRect(
                    borderRadius:const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Image(
                      image:AssetImage(crop.image),
                      width:double.maxFinite,
                      fit:BoxFit.cover,
                    ),
                  ),
                ),
              ) ,
            ),
            SliverToBoxAdapter(
              child:Column(
                mainAxisSize:MainAxisSize.max,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius:BorderRadius.only(
                        topLeft:Radius.circular(15),
                        topRight:Radius.circular(15),
                      )
                    ),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                         ExpandableWidget(text2:'Highly Nutritious and Particula'
                             'ly Rich in Vitamin A. ', text3: 'High Antioxidant Content May Reduce Your Risk of Chronic Diseases. ',text4:'Vitamin A, Lutein and Zeaxanthin May Protect Your Eyesight.',text6:'Fill a wok or saucepan 1/3 with water. Bring to the boil. Place prepared pumpkin slices in a steamer basket. Cover and steam over simmering water for 10 minutes or until almost tender.'),
                         Row(
                           children: [
                             VegetablesFarmersSearch(leftPadding:16.0,crop:crop,),
                           ],
                         ),
                         GetBuilder<ProductController>(
                           builder: (product) {
                             return Container(
                                    margin:const EdgeInsets.only(left:16.0,right:8.0,bottom:8.0),
                                    height:130,
                                    width:double.infinity,
                                    decoration:BoxDecoration(
                                        borderRadius:BorderRadius.circular(10),
                                        border:Border.all(
                                          color:Colors.black12,
                                          width:1.5,
                                        )
                                    ),
                                    child:Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children:[
                                              GestureDetector(
                                                onTap:(){
                                                  product.setQuantity(false);
                                                },
                                                child: Container(
                                                    width:50,
                                                    height:50,
                                                    decoration: BoxDecoration(
                                                        color:Colors.white,
                                                        shape:BoxShape.circle,
                                                        border:Border.all(
                                                            color:Colors.black12,
                                                            width:1.7
                                                        )
                                                    ),
                                                    child:Column(
                                                      children:const[
                                                        SizedBox(height:6),
                                                        Icon(Icons.minimize),
                                                      ],
                                                    ),
                                                ),
                                              ),
                                              const SizedBox(width:12),
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
                                                          BigText(text:'KES '+crop.price.toString()),
                                                          BigText(text:' x'),
                                                          BigText(text: product.inCartItems.toString()),
                                                        ]
                                                    ),
                                                  ),
                                              const SizedBox(width:12.0),
                                              Container(
                                                  width:50,
                                                  height:50,
                                                  decoration: BoxDecoration(
                                                      color:Colors.white,
                                                      shape:BoxShape.circle,
                                                      border:Border.all(
                                                          color:Colors.black12,
                                                          width:1.7
                                                      )
                                                  ),
                                                  child:GestureDetector(
                                                    onTap:(){
                                                      product.setQuantity(true);
                                                    },
                                                    child: const Icon(Icons.add )
                                                  )
                                              ),
                                            ]
                                        )
                                    );
                           }
                         )
                      ]
                    )
                  )
                ],
              )
            ),
          ]
        ),
      ),
      bottomNavigationBar: Container(
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