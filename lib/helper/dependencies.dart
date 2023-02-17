import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Farmdrive/%20repository/User_Repository.dart';
import 'package:Farmdrive/%20repository/cart_repository.dart';
import 'package:Farmdrive/%20repository/cereals_repository.dart';
import 'package:Farmdrive/%20repository/farmer_repository.dart';
import 'package:Farmdrive/%20repository/order_repository.dart';
import 'package:Farmdrive/%20repository/popular_product_repository.dart';
import 'package:Farmdrive/%20repository/product_repostitory.dart';
import 'package:Farmdrive/controller/cart_controller.dart';
import 'package:Farmdrive/controller/cereals_controller.dart';
import 'package:Farmdrive/controller/farmer_controller.dart';
import 'package:Farmdrive/controller/fruits_controller.dart';
import 'package:Farmdrive/controller/popular_product_controller.dart';
import 'package:Farmdrive/controller/product_controller.dart';
import 'package:Farmdrive/data/crop_data.dart';

import '../ repository/auth_repository.dart';
import '../ repository/bank_repo.dart';
import '../ repository/crop_pricing_repo.dart';
import '../ repository/fruits_repository.dart';
import '../ repository/image_repo.dart';
import '../ repository/location_repo.dart';
import '../ repository/mpesa_repo.dart';
import '../ repository/product_class_repository.dart';
import '../ repository/review_repo.dart';
import '../controller/auth_controllers.dart';
import '../controller/bank_controller.dart';
import '../controller/crop_pricing_controller.dart';
import '../controller/image_controller.dart';
import '../controller/location_controller.dart';
import '../controller/mpesa_controller.dart';
import '../controller/order_controller.dart';
import '../controller/product_class_controller.dart';
import '../controller/review_controller.dart';
import '../controller/user_controller.dart';
import '../data/FruitInfo.dart';
import '../data/api/api_client.dart';
import '../utilities/AppConstants.dart';


Future<void> init()  async {

  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(()=>sharedPreferences);

  //apiClient
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL, sharedPreferences: sharedPreferences),fenix: true);



  //controllers
  Get.lazyPut(()=>CartController(cartRepo: Get.find()),fenix:true);
  Get.lazyPut(()=>ProductController(productRepo:Get.find()),fenix:true);
  Get.lazyPut(()=>FarmerController(farmerRepo:Get.find()),fenix:true);
  Get.lazyPut(()=>PopularProductController( popularProductRepo: Get.find()),fenix:true);
  Get.lazyPut(()=>CerealsController(cerealsRepository: Get.find()),fenix:true);
  Get.lazyPut(()=>FruitController(fruitRepository: Get.find()),fenix:true);
  Get.lazyPut(()=> CropPricingController(cropPricingRepo: Get.find()),fenix:true);

  Get.lazyPut(()=>AuthController( authRepo: Get .find()),fenix:true);
  Get.lazyPut(()=>UserController( userRepository: Get.find()),fenix:true);
  Get.lazyPut(()=>OrderController(orderRepo: Get.find()),fenix:true);
  Get.lazyPut(()=>LocationController(locationRepo: Get.find()),fenix:true);
  Get.lazyPut(()=>MpesaController(mpesaRepo: Get.find()),fenix:true);
  Get.lazyPut(()=>ProductClassController(productClassRepository: Get.find()),fenix:true);
  Get.lazyPut(()=>BankController(bankRepo: Get.find()),fenix:true);
  Get.lazyPut(()=>ImageController(imageRepo: Get.find()),fenix:true);
  Get.lazyPut(()=>ReviewController(reviewRepo: Get.find()),fenix:true);


  //repository
  Get.lazyPut(()=>CartRepo(sharedPreferences: Get.find()),fenix:true);
  Get.lazyPut(()=>ProductRepo(),fenix:true);
  Get.lazyPut(()=>FarmerRepo(apiClient:Get.find(),sharedPreferences: Get.find()),fenix:true);
  Get.lazyPut(()=>PopularProductRepo(apiClient: Get.find()),fenix:true);
  Get.lazyPut(()=>CerealsRepository(apiClient: Get.find()),fenix:true);
  Get.lazyPut(() => ProductClassRepository(apiClient:Get.find()),fenix:true);
  Get.lazyPut(() => CropPricingRepo(apiClient:Get.find(),sharedPreferences: Get.find()),fenix:true);

  Get.lazyPut(()=>AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()),fenix:true);
  Get.lazyPut(()=>UserRepository( sharedPreferences:Get.find(),apiClient: Get.find()),fenix:true);
  Get.lazyPut(()=>FruitRepository( apiClient: Get.find()),fenix:true);
  Get.lazyPut(()=>OrderRepository(apiClient:Get.find(),sharedPreferences: Get.find()),fenix: true);
  Get.lazyPut(()=>FruitDetails(),fenix:true);
  Get.lazyPut(()=>LocationRepo(apiClient:Get.find(),sharedPreferences:Get.find()),fenix:true);
  Get.lazyPut(()=>MpesaRepo(apiClient:Get.find()),fenix:true);
  Get.lazyPut(()=>BankRepo(apiClient:Get.find()),fenix:true);
  Get.lazyPut(()=>ImageRepo(apiClient:Get.find(), sharedPreferences: Get.find()),fenix:true);
  Get.lazyPut(()=>ReviewRepo(apiClient:Get.find(), sharedPreferences: Get.find()),fenix:true);



}