import 'package:Farmdrive/presentation/screen/nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Farmdrive/data/order_model.dart';
import 'package:Farmdrive/presentation/screen/home_screen.dart';
import 'package:Farmdrive/presentation/pages/profile/farmer_info.dart';
import 'package:Farmdrive/presentation/screen/splash_screen.dart';
import 'package:Farmdrive/utilities/color_constants.dart';
import 'controller/auth_controllers.dart';
import 'controller/bank_controller.dart';
import 'controller/cereals_controller.dart';
import 'controller/crop_pricing_controller.dart';
import 'controller/farmer_controller.dart';
import 'controller/fruits_controller.dart';
import 'controller/image_controller.dart';
import 'controller/order_controller.dart';
import 'controller/popular_product_controller.dart';
import 'controller/product_class_controller.dart';
import 'controller/review_controller.dart';
import 'controller/user_controller.dart';
import ' repository/cart_repository.dart';
import 'constants/route_helper.dart';
import 'controller/cart_controller.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    // Get.find<UserController>().setUserInfo();
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

    return GetBuilder<CartController>(
              builder: (context) {
                return GetMaterialApp(
                    debugShowCheckedModeBanner: false,
                   home:  NavBar(),
                      theme: ThemeData(
                        scaffoldBackgroundColor: Colors.white,
                      ),
                // initialRoute:RouteHelper.getSplashScreen(),
                 getPages: RouteHelper.pages,
                    );
              }
            );

  }
}
