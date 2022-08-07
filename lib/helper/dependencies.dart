import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled3/%20repository/cart_repository.dart';
import 'package:untitled3/%20repository/farmer_repository.dart';
import 'package:untitled3/%20repository/product_repostitory.dart';
import 'package:untitled3/controller/cart_controller.dart';
import 'package:untitled3/controller/farmer_controller.dart';
import 'package:untitled3/controller/product_controller.dart';


Future<void> init()  async {

  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(()=>sharedPreferences);
  //controllers
  Get.lazyPut(()=>CartController(cartRepo: Get.find()),fenix:true);
  Get.lazyPut(()=>ProductController(productRepo:Get.find()),fenix:true);
  Get.lazyPut(()=>FarmerController(farmerRepo:Get.find()),fenix:true);

  //repository
  Get.lazyPut(()=>CartRepo(sharedPreferences: Get.find()),fenix:true);
  Get.lazyPut(()=>ProductRepo(),fenix:true);
  Get.lazyPut(()=>FarmerRepo(sharedPreferences: Get.find()),fenix:true);

}