import 'dart:io';


import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:Farmdrive/controller/popular_product_controller.dart';
import 'package:Farmdrive/presentation/pages/cart_history%20_page.dart';
import 'package:Farmdrive/presentation/widget/cereal_couresel.dart';
import 'package:Farmdrive/presentation/widget/fruit_couresel.dart';
import 'package:Farmdrive/presentation/widget/vegetable_couresel_1.dart';
import 'package:get/get.dart';

import '../../ repository/cart_repository.dart';
import '../../controller/auth_controllers.dart';
import '../../controller/bank_controller.dart';
import '../../controller/cart_controller.dart';
import '../../controller/cereals_controller.dart';
import '../../controller/connectivity.dart';
import '../../controller/crop_pricing_controller.dart';
import '../../controller/farmer_controller.dart';
import '../../controller/fruits_controller.dart';
import '../../controller/image_controller.dart';
import '../../controller/order_controller.dart';
import '../../controller/product_class_controller.dart';
import '../../controller/product_controller.dart';
import '../../controller/review_controller.dart';
import '../../controller/user_controller.dart';
import '../../data/product_model.dart';
import '../../utilities/AppConstants.dart';
import '../../utilities/color_constants.dart';
import '../../utilities/dimensions.dart';
import '../widget/reusable_widget/big_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  FocusNode? _focusNode = FocusNode();
  String? selectedCrop;
  int selectedIndex = 0;
  List   allCropList = [...Get.find<PopularProductController>().popularProductList, ...Get.find<FruitController>().fruitsList, ...Get.find<CerealsController>().cerealsList];
  List displayList  = [];
  bool isUpdated = false;
  updateList(String value){
    isUpdated = true;
    if(value.isEmpty){
      displayList = [];
    }else{
      displayList = allCropList.where((element) =>
          element.kind!.toLowerCase().contains(value.toLowerCase())).toList();
    }
  }

  Map _source = {ConnectivityResult.none: false};
  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;
  String string = '';
  bool isOnline = false;
  void initState() {
    super.initState();
    _networkConnectivity.initialise();
    _networkConnectivity.myStream.listen((source) {
      _source = source;
      print('source $_source');
      // 1.
      switch (_source.keys.toList()[0]) {
        case ConnectivityResult.mobile:
          string =
          _source.values.toList()[0] ? 'Online'  : 'You\'re offline';
          if(_source.values.toList()[0] ) isOnline = true;
          break;
        case ConnectivityResult.wifi:
          string =
          _source.values.toList()[0] ? 'Online' : 'You\'re offline';
          if(_source.values.toList()[0] ) isOnline = true;
          break;
        case ConnectivityResult.none:
        default:
          string = 'You\'re offline';
      }
      // 2.
      setState(() {});
      // 3
    });
  }

  @override
  void dispose() {
    _networkConnectivity.disposeStream();
    super.dispose();
  }



  void  _loadResource(){
    if(Get.find<AuthController>().userLoggedIn()){
      if(!Get.find<AuthController>().getUser()) {
        Get.find<UserController>().getUserInfo();
        Get.find<AuthController>().getUserId();
        Get.find<OrderController>().getDeliveredOrders();
        Get.find<ReviewController>().getReviewData;
        Get.find<ReviewController>().getReviewTextData;
      }else{
        Get.find<AuthController>().getFarmerId();
        Get.find<FarmerController>().geCropPricing();
        Get.find<FarmerController>().getSelectedCropList();
        Get.find<BankController>().getBankList();
        Get.find<FarmerController>().getCropPricingData;
        Get.find<UserController>().getFarmerInfo();
        Get.find<OrderController>().getCustomerOrders();
        Get.find<OrderController>().getDeliveredStorageData;
      }
      Get.find<ImageController>().getProfileImage();
      Get.find<OrderController>().getOrderData;
      Get.find<OrderController>().getCancelledStorageData;
      Get.find<OrderController>().getConfirmedStorageData;
      Get.find<OrderController>().getPayedStorageData;
    }
    Get.find<ProductClassController>().getCropClasses();
    Get.find<CerealsController>().getCerealsList();
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<CerealsController>().getCerealsList();
    Get.find<FruitController>().getFruitsList();
    Get.find<FarmerController>().getCropFarmers();
    Get.find<FarmerController>().getFarmerData;
    Get.find<CropPricingController>().getCropPricingData;
    Get.find<CartController>().getCartData;
    Get.find<CartRepo>().getCartHistoryList();
    Get.find<CropPricingController>().getCropPricingList();
  }

  @override
  Widget build(BuildContext context) {
    allCropList = [...Get.find<PopularProductController>().popularProductList, ...Get.find<FruitController>().fruitsList, ...Get.find<CerealsController>().cerealsList];
    _focusNode?.unfocus();
    if(isOnline){
      _loadResource();
      isOnline = false;
    }
    return   RefreshIndicator(
      color:AppColors.mainColor,
      onRefresh: () async{
        _loadResource();
      },
      child: Scaffold(
              backgroundColor: Colors.white24,
              body:GestureDetector(
                onTap:(){
                  FocusScope.of(context).unfocus();
                  isUpdated = false;
                },
                child: SafeArea(
                  child: SafeArea(
                    child: ListView(
                      padding:EdgeInsets.symmetric(horizontal:Dimensions.width12),
                      children:  [
                        SizedBox(height:Dimensions.height6),
                        string == 'Online'?SizedBox.shrink():BigText(text:string,size:18),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            BigText(text:'Farmdrive',size:26),
                            Row(
                              children: [
                                GetBuilder<ImageController>(
                                  builder: (imageController) {
                                    return CircleAvatar(
                                      backgroundColor: Colors.grey[300],
                                      backgroundImage:imageController.imagePath != null ?NetworkImage(
                                        AppConstants.BASE_URL+imageController
                                            .imagePath!,
                                      )  : null,
                                    );
                                  }
                                ),
                                SizedBox(width:Dimensions.width4/2),
                              ],
                            )
                          ]
                        ),
                        SizedBox(height:Dimensions.height6*2),
                        Container(
                          //margin:EdgeInsets.only(left:Dimensions.width20),
                          //padding: const EdgeInsets.all(6.0),
                          alignment: Alignment.centerLeft,
                          height: Dimensions.height10*5,
                          decoration:BoxDecoration(
                            color:Colors.grey[100],
                            borderRadius:BorderRadius.circular(20.0),
                          ),
                          child: TextField(
                            cursorColor: AppColors.mainColor,
                            decoration:InputDecoration(
                              prefixIcon: Icon(Icons.search,color:Colors.black,size:30),
                              suffixIcon:Icon(Icons.import_export_outlined,color:Colors.black),
                              hintText: 'Search crop to buy',
                              border:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color:Colors.grey[100]!,
                                  )
                              ),

                              focusedBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color:Colors.grey[100]!,
                                )

                              ),
                              enabledBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color:Colors.grey[100]!,
                                  )

                            ),
                            ),
                            onChanged: (String value){
                              setState(() {
                                updateList(value);
                              });
                            },

                            autofocus: false,
                            onSubmitted: (value) {
                              isUpdated = true;
                            },
                          ),
                        ),
                        SizedBox(height:Dimensions.height10*2),
                        VegetableCouresel(displayList:isUpdated?displayList:[]),
                        FruitCouresel(),
                        CerealCouresel()
                      ],

                    ),
                  ),
                ),
              ),

   ),
    );}
}
