import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:Farmdrive/controller/auth_controllers.dart';
import 'package:Farmdrive/controller/cart_controller.dart';
import 'package:Farmdrive/controller/farmer_controller.dart';
import 'package:Farmdrive/controller/product_controller.dart';
import 'package:Farmdrive/presentation/pages/vegetables_page.dart';
import 'package:Farmdrive/presentation/screen/nav_screen.dart';
import 'package:Farmdrive/presentation/widget/reusable_widget/big_text.dart';
import 'package:Farmdrive/presentation/widget/reusable_widget/small_text.dart';
import 'package:Farmdrive/utilities/AppConstants.dart';

import '../../constants/route_helper.dart';
import '../../controller/cereals_controller.dart';
import '../../controller/crop_pricing_controller.dart';
import '../../controller/fruits_controller.dart';
import '../../controller/mpesa_controller.dart';
import '../../controller/order_controller.dart';
import '../../controller/popular_product_controller.dart';
import '../../controller/user_controller.dart';
import '../../data/cart_model.dart';
import '../../data/model/crop_pricing.dart';
import '../../utilities/color_constants.dart';
import '../../utilities/dimensions.dart';
import '../pages/cart_history _page.dart';
import '../widget/sign_in/show_custom_snackBar.dart';
import '../pages/cereal_page.dart';
import '../pages/fruit_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool showPaymentTerms = false;
  FocusNode? focusNode;
  String? selectedPhoneNo;
  late int cartIndex;

  @override
  Widget build(BuildContext context) {
    validate(Cart cart, BuildContext ctx) {
      if (selectedPhoneNo == null ||
          selectedPhoneNo!.isEmpty ||
          selectedPhoneNo!.length < 12) {
        showCustomSnackBar('Fill in a valid phone number +2547...',
            title: 'Phone Number');
      } else {
        Get.find<FarmerController>().remove(cart);
        Get.find<OrderController>().addOrderItems(cart, 'PAYMENT VIA MPESA');
        Get.find<CartController>()
            .addToCartHistoryList(index: cartIndex, cart: cart);
        setState(() {
          showPaymentTerms = false;
        });
        //Get.find<MpesaController>().getToken();
        Get.find<MpesaController>()
            .stkPush(selectedPhoneNo!, cart.quantity * cart.price, 'PAYBILL');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: AppColors.backgroundColor,
            content: SizedBox(
              height: Dimensions.height10*2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('My Orders',
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                  Text('Processing MPESA payment ...',
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                ],
              ),
            )));

        Navigator.of(ctx).pop();
      }
    }

    return GetBuilder<CartController>(builder: (cartController) {
      List cartItems = cartController.getItems;
      return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Stack(children: [
                Positioned(
                    top: Dimensions.height10 * 7,
                    left: Dimensions.width4 * 4,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: EdgeInsets.all(Dimensions.width4*2),
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.arrow_back_ios_outlined,
                            color: Colors.white, size: 18),
                      ),
                    )),
                Positioned(
                    top: Dimensions.height10 * 7,
                    right: Dimensions.width12 * 7,
                    child: GestureDetector(
                        onTap: () {
                          Get.to(() => NavBar());
                        },
                        child: Container(
                          padding:EdgeInsets.all(Dimensions.width4*2),
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.home_filled,
                              color: Colors.white, size: 18),
                        ))),
                Positioned(
                    top: Dimensions.height6 * 11,
                    right: Dimensions.width4 * 4,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => CartHistory());
                      },
                      child: Icon(Icons.history,
                          color: AppColors.mainColor!, size: 40),
                    )),
                Positioned(
                    top: Dimensions.height10*13,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        itemCount: cartItems.isEmpty? 1:cartItems.length,
                        itemBuilder: (context, index) {
                          if(cartItems.isEmpty){
                            return Column(
                                mainAxisAlignment:MainAxisAlignment.center,
                                children: [
                                   SizedBox(height:Dimensions.height10*8),
                                  Stack(
                                    children: [
                                      Image(
                                        height:Dimensions.height100*2,
                                        width:Dimensions.width100*3,
                                        image: AssetImage('assets/logo/cart.jpg'),
                                      ),
                                      Positioned(
                                          bottom:0,
                                          left:0,
                                          right:0,
                                          child:Container(
                                            height:Dimensions.height10*2,
                                            color:Colors.white,
                                          )
                                      ),
                                    ],
                                  ),
                                  SizedBox(height:Dimensions.height10*4),
                                  SmallText(text:'Buy an item to add to cart history',size:18),
                                  SizedBox(
                                    height:Dimensions.height4,
                                  ),
                                  SmallText(text:'Cart History is Empty!!',size:18),
                                  SizedBox(
                                    height:Dimensions.height100+Dimensions.height40/2,
                                  )
                                ]
                            );
                          }
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(children: [
                              GestureDetector(
                                onTap: () {
                                  // if (cartItems[index].crop.category == 'Vegetable') {
                                  //   print('is fruit type'+cartItems[index].crop.runtimeType.toString());
                                  //   Get.to(() =>
                                  //       VegetablesPage(
                                  //           crop: cartItems[index]
                                  //               .crop));
                                  // } else if (cartItems[index].crop.category == 'Fruit') {
                                  //   print('is fruit type'+cartItems[index].crop.runtimeType.toString());
                                  //   Get.to(() =>
                                  //       FruitPage(
                                  //           crop: cartItems[index].crop
                                  //       ));
                                  // } else if(cartItems[index].crop.category == 'Cereal'){
                                  //   print('is fruit type'+cartItems[index].crop.category.toString());
                                  //   Get.to(() =>
                                  //       CerealPage(
                                  //         crop: cartItems[index].crop,
                                  //       ));
                                  // }
                                  print('width is ' +
                                      Get.context!.width.toString());
                                },
                                child: Container(
                                    margin: EdgeInsets.only(
                                        left: Dimensions.width10, bottom: Dimensions.height4*2),
                                    height: Dimensions.height100,
                                    width: Dimensions.width100,
                                    decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 2,
                                          offset: Offset(1, 1),
                                        ),
                                        BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 2,
                                            offset: Offset(-1, -1))
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image(
                                        image: NetworkImage(
                                            AppConstants.BASE_URL +
                                                AppConstants.UPLOADS +
                                                cartItems[index].image),
                                        fit: BoxFit.cover,

                                        errorBuilder: (context, error, stackTrace) {
                                          print('error'+error.toString());
                                          return Container(
                                            height: Dimensions.height100,
                                            width: Dimensions.width100,
                                            color: Colors.grey[200],
                                          );
                                        },
                                      ),
                                    )),
                              ),
                              SizedBox(width: Dimensions.width10),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          BigText(
                                              text: cartItems[index].type,
                                              size: 18),
                                          Column(
                                            children: [
                                              Container(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: BigText(
                                                    text: ".",
                                                    color: Colors.black54,
                                                    size: 24,
                                                  )),
                                            ],
                                          ),
                                           SizedBox(
                                             width:Dimensions.width10*12,
                                             child: SmallText(
                                                 text: cartItems[index].size+'-sized',
                                                color: Colors.black54,
                                                size: 14.0,
                                               maxLines:1),
                                           ),
                                        ]),
                                    SizedBox(height: Dimensions.height10),
                                    Row(
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                  color: Colors.black12,
                                                )),
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets
                                                          .symmetric(
                                                      horizontal:Dimensions.width4*2,
                                                      vertical: Dimensions.height4/2),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(20),
                                                        bottomLeft:
                                                            Radius.circular(20),
                                                      ),
                                                      border: Border.all(
                                                        color: Colors.black12,
                                                      )),
                                                  child: const CircleAvatar(
                                                    backgroundImage: AssetImage(
                                                        'assets/logo/mpesa_logo.jpeg'),
                                                    radius: 16.0,
                                                  ),
                                                ),
                                                 SizedBox(width: Dimensions.width12),
                                                SizedBox(
                                                  width: Dimensions.width100,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.only(
                                                            right: Dimensions.width20-Dimensions.width4/2),
                                                    child: SmallText(
                                                      text: cartItems[index]
                                                          .farmerModel
                                                          .name,
                                                      color: Colors.black87,
                                                      size: 12,
                                                      maxLines: 1,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                        SizedBox(
                                          width: Dimensions.width20,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            if (Get.find<AuthController>()
                                                .userLoggedIn()) {
                                              if(Get.find<AuthController>().getUser()){
                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                    backgroundColor: Color.lerp(Colors.black,Colors.grey,0.5),
                                                    content: Container(
                                                      height: Dimensions.height10*4,
                                                      decoration:BoxDecoration(
                                                        borderRadius:BorderRadius.circular(6.0),
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: const [
                                                          SmallText(text:"Sign in as a normal user to buy items",color:Colors.white),
                                                        ],
                                                      ),
                                                    )
                                                ));
                                              }else {
                                                setState(() {
                                                  showPaymentTerms =
                                                  !showPaymentTerms;
                                                  cartIndex = index;
                                                });
                                              }
                                            } else {
                                              Get.toNamed(
                                                  RouteHelper.getSignInPage());
                                            }
                                            // if(Get.find<AuthController>().userLoggedIn()) {
                                            //   Get.find<FarmerController>().remove(cartItems[index]);
                                            //   Get.find<OrderController>().addOrderItems(cartItems[index]);
                                            //   cartController.addToCartHistoryList(index: index, cart: cartItems[index]);
                                            // }else{
                                            //   Get.toNamed(RouteHelper.getSignInPage());
                                            // }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                  color: Colors.green,
                                                  width: 1.5,
                                                )),
                                            child: Container(
                                              margin:  EdgeInsets.all(Dimensions.width4/2),
                                              padding:
                                                   EdgeInsets.all(Dimensions.width12/2),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: AppColors.mainColor,
                                              ),
                                              child: const SmallText(
                                                  text: 'BUY',
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: Dimensions.width100*3-Dimensions.width10*7,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          cartItems[index]
                                              .cropPricing!= null?BigText(
                                              text: cartItems[index]
                              .cropPricing.cost != null?'KES ' +
                                                  cartItems[index]
                                                      .cropPricing.cost.toString():'KES '+cartItems[index]
                                                  .crop.price.toString(),
                                              size: 20,
                                              color: Colors.redAccent.shade200):BigText(
                                              text: 'KES ' +
                                                  cartItems[index]
                                                      .crop.price.toString(),
                                              size: 20,
                                              color: Colors.redAccent.shade200),
                                          Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Column(
                                                  children: [
                                                    SizedBox(
                                                        height: Dimensions.height10),
                                                    GestureDetector(
                                                        onTap: () {
                                                          final farmer = Get.find<
                                                                  FarmerController>()
                                                              .getFarmer(
                                                                  cartItems[
                                                                          index]
                                                                      .crop);
                                                          final cropPricing = Get.find<CropPricingController>().getPricing(cartItems[
                                                          index]
                                                              .crop);

                                                          cartController.addItem(
                                                             size:cartItems[
                                                             index].size,
                                                              classification:cartItems[index].classification,
                                                              cropPricing: cropPricing,
                                                              farmerModel:
                                                                  farmer,
                                                              crop: cartItems[
                                                                      index]
                                                                  .crop,
                                                              quantity: -1);
                                                        },
                                                        child: Column(
                                                          children:  [
                                                            Icon(Icons.remove),
                                                            SizedBox(
                                                              height: Dimensions.height10,
                                                            ),
                                                          ],
                                                        )),
                                                  ],
                                                ),
                                                SizedBox(width: Dimensions.width12),
                                                BigText(
                                                  text: cartItems[index]
                                                      .quantity
                                                      .toString(),
                                                ),
                                                SizedBox(width:Dimensions.width12),
                                                GestureDetector(
                                                    onTap: () {
                                                      final farmer = Get.find<
                                                              FarmerController>()
                                                          .getFarmer(
                                                              cartItems[index]
                                                                  .crop);
                                                      final cropPricing = Get.find<
                                                          CropPricingController>()
                                                          .getPricing(
                                                          cartItems[index]
                                                              .crop);
                                                      cartController.addItem(
                                                          size:cartItems[
                                                          index].size,
                                                          classification:cartItems[index].classification,
                                                          cropPricing: cropPricing,
                                                          farmerModel: farmer,
                                                          quantity: 1,
                                                          crop: cartItems[index]
                                                              .crop);
                                                    },
                                                    child:
                                                        const Icon(Icons.add))
                                              ]),
                                        ],
                                      ),
                                    )
                                  ])
                            ]),
                          );
                        },
                      ),
                    ))
              ]),
              Positioned(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    showPaymentTerms = false;
                  });
                },
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color:
                      showPaymentTerms ? Colors.black.withOpacity(0.2) : null,
                ),
              )),
              showPaymentTerms
                  ? Positioned(
                      top: Dimensions.height100*3,
                      left: Dimensions.width10*2,
                      child: Container(
                          height: Dimensions.height100,
                          width: Dimensions.width100*3+Dimensions.width4*6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(1, 1),
                                spreadRadius: 1,
                                blurRadius: 1,
                              ),
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(-1, -1),
                                spreadRadius: 1,
                                blurRadius: 1,
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text('Terms',
                                      style: TextStyle(
                                        fontSize: 20,
                                      )),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (BuildContext ctx) {
                                          return Container(
                                              height: Dimensions.height100*6,
                                              padding: EdgeInsets.only(
                                                  top: Dimensions.height10*2,
                                                  left: Dimensions.width10*2,
                                                  right: Dimensions.width10*2,
                                                  bottom: MediaQuery.of(ctx)
                                                          .viewInsets
                                                          .bottom +
                                                      20),
                                              child: SizedBox(
                                                  height: Get.height,
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets
                                                                  .only(
                                                            top: Dimensions.height10*4,
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              BigText(
                                                                  text:
                                                                      'Pay Crop Fee',
                                                                  size: 18),
                                                              GestureDetector(
                                                                  onTap: () {
                                                                    Navigator.of(
                                                                            ctx)
                                                                        .pop();
                                                                  },
                                                                  child:
                                                                      const Icon(
                                                                    Icons
                                                                        .cancel,
                                                                    color: Colors
                                                                        .green,
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(height: Dimensions.height10*3),
                                                        TextField(
                                                          onChanged:
                                                              (String value) {
                                                            setState(() {
                                                              selectedPhoneNo =
                                                                  value;
                                                            });
                                                          },
                                                          focusNode: focusNode,
                                                          autofocus: true,
                                                          decoration:
                                                              const InputDecoration(
                                                            focusColor:
                                                                Colors.green,
                                                            label: SmallText(
                                                                text:
                                                                    'Phone Number'),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                              color:
                                                                  Colors.green,
                                                              width: 1.5,
                                                            )),
                                                            disabledBorder:
                                                                OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                              color:
                                                                  Colors.green,
                                                              width: 1.5,
                                                            )),
                                                          ),
                                                          onSubmitted:
                                                              (value) {},
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          inputFormatters: <
                                                              TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .digitsOnly
                                                          ],
                                                        ),
                                                        SizedBox(height: Dimensions.height10*2),
                                                        GestureDetector(
                                                          onTap: () {
                                                            validate(
                                                                cartItems[
                                                                    cartIndex],
                                                                ctx);
                                                          },
                                                          child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .green,
                                                                        width:
                                                                            1.5,
                                                                      )),
                                                              child: Row(
                                                                  children: [
                                                                    SizedBox(
                                                                        width:
                                                                            Dimensions.width10*2),
                                                                    SizedBox(
                                                                        child: Image(
                                                                            height:
                                                                            Dimensions.height10*6+Dimensions.height4/2,
                                                                            width:
                                                                            Dimensions.width10*4,
                                                                            image:
                                                                                AssetImage('assets/logo/mpesa_logo.jpeg'))),
                                                                    SizedBox(
                                                                        width:
                                                                        Dimensions.width10*2),
                                                                    BigText(
                                                                        text:
                                                                            'Payment With MPESA',
                                                                        size:
                                                                            18),
                                                                  ])),
                                                        ),
                                                      ],
                                                    ),
                                                  )));
                                        });
                                  },
                                  child: Padding(
                                    padding:  EdgeInsets.only(
                                        left: Dimensions.width10*3, top: Dimensions.height6),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                            child: Image(
                                                height: Dimensions.height4*8,
                                                width: Dimensions.width10*2,
                                                image: AssetImage(
                                                    'assets/logo/mpesa_logo.jpeg'))),
                                        SizedBox(width: Dimensions.width10*2),
                                        Text('Payment Via MPESA',
                                            style: TextStyle(
                                              fontSize: 22,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {

                                    Get.find<FarmerController>()
                                        .remove(cartItems[cartIndex]);
                                    Get.find<OrderController>().addOrderItems(
                                        cartItems[cartIndex],
                                        'CASH '
                                        'AFTER DELIVERY');
                                    cartController.addToCartHistoryList(
                                        index: cartIndex,
                                        cart: cartItems[cartIndex]);
                                    setState(() {
                                      showPaymentTerms = false;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            backgroundColor:
                                                AppColors.backgroundColor,
                                            content: SizedBox(
                                              height: Dimensions.height10*5,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text('My Orders',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.black)),
                                                  Text(
                                                      'Order sent  succesfully!!',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.black)),
                                                ],
                                              ),
                                            )));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: Dimensions.width10*3, top:Dimensions.height6),
                                    child: Row(
                                      children: [
                                        Icon(Icons.ios_share),
                                        SizedBox(width: 16),
                                        Text('Payment After Delivery',
                                            style: TextStyle(
                                              fontSize: 22,
                                            )),
                                      ],
                                    ),
                                  ),
                                )
                              ])))
                  : const SizedBox.shrink(),
            ],
          ),
          bottomNavigationBar: Container(
              width: double.maxFinite,
              margin: EdgeInsets.all(Dimensions.width10),
              height: Dimensions.height10 * 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey[300],
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.find<FarmerController>().editCropPricing(
                            CropPricing(
                              cost: 40,
                              inStock: true,
                              categoryId: 1,
                            )
                        );
                        List cartItems= Get.find<CartController>().getItems;
                        if (Get.find<AuthController>().userLoggedIn()&& cartItems.isNotEmpty) {
                          if(Get.find<AuthController>().getUser()){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Color.lerp(Colors.black,Colors.grey,0.5),
                                content: Container(
                                  height: Dimensions.height10*4,
                                  decoration:BoxDecoration(
                                    borderRadius:BorderRadius.circular(6.0),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      SmallText(text:"Sign in as a normal user to buy items",color:Colors.white),
                                    ],
                                  ),
                                )
                            ));
                          }else {
                            for (int i = 0; i < cartItems.length; i++) {
                              Get.find<FarmerController>()
                                  .remove(cartItems[i]);
                              Get.find<OrderController>().addOrderItems(
                                  cartItems[i],
                                  'CASH '
                                      'AFTER DELIVERY');
                              cartController.addToCartHistoryList(
                                  index: i, cart: cartItems[i]);
                            }
                            Get.snackbar(
                              'Order', 'Cart items were added to order list',
                              backgroundColor: Colors.lightGreenAccent.shade100,
                            );

                          }
                        } else if(!Get.find<AuthController>().userLoggedIn()) {
                          Get.toNamed(RouteHelper.getSignInPage());
                        }
                      },
                      child: Container(
                          alignment: Alignment.center,
                          height: Dimensions.height10 * 4,
                          width: Dimensions.width12 * 10,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.mainColor!,
                                AppColors.mainColor!,
                                Colors.amber
                              ],
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: BigText(
                              text: cartItems.isEmpty?'Total':'BUY ALL', color: Colors.white, size: 18)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.symmetric(vertical: Dimensions.height10),
                      height: Dimensions.height10 * 4,
                      width: Dimensions.width12 * 14,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: BigText(
                          size: 18,
                          text: "KES" + cartController.getTotal.toString()),
                    ),
                  ])));
    });
  }
}
