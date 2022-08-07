import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/controller/cart_controller.dart';
import 'package:untitled3/controller/farmer_controller.dart';
import 'package:untitled3/controller/product_controller.dart';
import 'package:untitled3/presentation/pages/vegetables_page.dart';
import 'package:untitled3/presentation/screen/nav_screen.dart';
import 'package:untitled3/presentation/widget/reusable_widget/big_text.dart';
import 'package:untitled3/presentation/widget/reusable_widget/small_text.dart';

import 'cereal_page.dart';
import 'fruit_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        builder: (cartController) {
          List cartItems = cartController.getItems;
          return Scaffold(
              backgroundColor: Colors.white,
              body: Stack(
                  children: [
                    Positioned(
                        top: 82.0,
                        left: 16.0,
                        child: GestureDetector(
                          onTap: () {
                           Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                              color: Colors.lightBlueAccent,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.arrow_back_ios_outlined),
                          ),
                        )
                    ),
                    Positioned(
                        top: 82.0,
                        right: 82.0,
                        child: GestureDetector(
                            onTap: () {
                              Get.to(() => NavScreen());
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                color: Colors.lightBlueAccent,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.home_filled),
                            )
                        )
                    ),
                    Positioned(
                        top: 82.0,
                        right: 16.0,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                            color: Colors.lightBlueAccent,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.shopping_cart),
                        )
                    ),
                    Positioned(
                      top: 78,
                      left: 360,
                      child: GetBuilder<ProductController>(
                          builder: (product) {
                            return SmallText(
                                text: product.getTotalItems().toString());
                          }
                      ),

                    ),
                    Positioned(
                        top: 130,
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.builder(
                            itemCount: cartItems.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (cartItems[index].crop.category == 'Vegetable') {
                                            print('is fruit type'+cartItems[index].crop.runtimeType.toString());
                                            Get.to(() =>
                                                VegetablesPage(
                                                    crop: cartItems[index]
                                                        .crop));
                                          } else if (cartItems[index].crop.category == 'Fruit') {
                                            print('is fruit type'+cartItems[index].crop.runtimeType.toString());
                                            Get.to(() =>
                                                FruitPage(
                                                    crop: cartItems[index].crop
                                                ));
                                          } else if(cartItems[index].crop.category == 'Cereal'){
                                            print('is fruit type'+cartItems[index].crop.category.toString());
                                            Get.to(() =>
                                                CerealPage(
                                                  crop: cartItems[index].crop,
                                                ));
                                          }
                                        },
                                        child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 14, bottom: 8.0),
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              boxShadow: const[
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 2,
                                                  offset: Offset(1, 1),
                                                ),
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 2,
                                                    offset: Offset(-1, -1)
                                                )
                                              ],
                                              borderRadius: BorderRadius
                                                  .circular(10),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius
                                                  .circular(10),
                                              child: Image(
                                                image: AssetImage(
                                                    cartItems[index].image),
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Row(
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .end,
                                                children: [
                                                  BigText(text: cartItems[index]
                                                      .type, size: 18),
                                                  Column(
                                                    children: [
                                                      Container(
                                                          alignment: Alignment
                                                              .topCenter,
                                                          child: BigText(
                                                            text: ".",
                                                            color: Colors
                                                                .black54,
                                                            size: 24,
                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                  const SmallText(
                                                      text: 'fresh, medium-sized',
                                                      colorValue: 0x8A000000,
                                                      size: 14.0),
                                                ]
                                            ),
                                            const SizedBox(height: 10.0),
                                            Row(
                                              children: [
                                                Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(20),
                                                        border: Border.all(
                                                          color: Colors.black12,
                                                        )
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          padding: const EdgeInsets
                                                              .symmetric(
                                                              horizontal: 8.0,
                                                              vertical: 2.0),
                                                          decoration: BoxDecoration(
                                                              borderRadius: const BorderRadius
                                                                  .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                    20),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                    20),
                                                              ),
                                                              border: Border
                                                                  .all(
                                                                color: Colors
                                                                    .black12,
                                                              )
                                                          ),
                                                          child: const CircleAvatar(
                                                            backgroundImage: AssetImage(
                                                                'assets/logo/mpesa_logo.jpeg'),
                                                            radius: 16.0,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 12.0),
                                                         SizedBox(
                                                           width:100,
                                                           child: Padding(
                                                            padding: const EdgeInsets
                                                                .only(
                                                                right: 18.0),
                                                            child: SmallText(
                                                                text: cartItems[index].farmer.name.toUpperCase(),
                                                                colorValue: 0xDD000000,
                                                                size: 12,
                                                                maxLines:1,
                                                            ),
                                                        ),
                                                         ),
                                                      ],
                                                    )
                                                ),
                                                const SizedBox(width: 40,),
                                                GestureDetector(
                                                  onTap:(){
                                                    Get.find<FarmerController>().remove(cartItems[index].crop);
                                                    cartController.addToCartHistoryList(index: index, crop: cartItems[index].crop);
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius
                                                            .circular(12),
                                                        border: Border.all(
                                                          color: Colors.green,
                                                          width: 1.5,
                                                        )
                                                    ),
                                                    child: Container(
                                                      margin: const EdgeInsets
                                                          .all(2.0),
                                                      padding: const EdgeInsets
                                                          .all(6.0),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(10),
                                                        color: Colors.green[700],
                                                      ),
                                                      child: const SmallText(
                                                          text: 'BUY',
                                                          colorValue: 0xFFFFFFFF),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width: 230,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  BigText(text:'KES'+ cartItems[index].price.toString(),
                                                      size: 20,
                                                      color: Colors.greenAccent
                                                          .shade700),
                                                  Row(
                                                      mainAxisSize: MainAxisSize
                                                          .max,
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .end,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            const SizedBox(
                                                                height: 10.0),
                                                            GestureDetector(
                                                                onTap: () {
                                                                  final farmer = Get
                                                                      .find<
                                                                      FarmerController>()
                                                                      .getFarmer(
                                                                      cartItems[index]
                                                                          .crop);
                                                                  cartController
                                                                      .addItem(
                                                                      farmer: farmer,
                                                                      crop: cartItems[index]
                                                                          .crop,
                                                                      quantity: -1);
                                                                },
                                                                child: Column(
                                                                  children: const [
                                                                    Icon(Icons
                                                                        .remove),
                                                                    SizedBox(
                                                                      height: 10,),
                                                                  ],
                                                                )),
                                                          ],
                                                        ),
                                                        SizedBox(width: 12.0),
                                                        BigText(
                                                          text: cartItems[index]
                                                              .quantity
                                                              .toString(),),
                                                        SizedBox(width: 12.0),
                                                        GestureDetector(
                                                            onTap: () {
                                                              final farmer = Get
                                                                  .find<
                                                                  FarmerController>()
                                                                  .getFarmer(
                                                                  cartItems[index]
                                                                      .crop);
                                                              cartController
                                                                  .addItem(
                                                                  farmer: farmer,
                                                                  quantity: 1,
                                                                  crop: cartItems[index]
                                                                      .crop);
                                                            },
                                                            child:const Icon(
                                                                Icons.add))
                                                      ]
                                                  ),

                                                ],
                                              ),
                                            )
                                          ]
                                      )
                                    ]
                                ),
                              );
                            },
                          ),
                        )
                    )
                  ]
              ),
              bottomNavigationBar: Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.symmetric(horizontal: 14.0),
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black.withOpacity(0.2),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            alignment: Alignment.center,
                            height: 60,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: BigText(
                                text: 'Total'
                            )
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 140,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: BigText(
                              text: "KES"+cartController.getTotal.toString()
                          ),
                        ),
                      ]
                  )
              )
          );
        }
    );
  }
}
