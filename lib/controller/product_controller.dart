
import 'dart:ui';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:Farmdrive/%20repository/product_repostitory.dart';
import '../data/farmer_model.dart';
import '../data/model/crop_pricing.dart';
import '../data/product_model.dart';
import 'cart_controller.dart';

class ProductController extends GetxController{
  final ProductRepo productRepo;
  ProductController({required this.productRepo});

  int _quantity = 0;
  int get quantity => _quantity;

   int _inCartItems = 0;
   int get inCartItem => _inCartItems;

   int get inCartItems => _inCartItems + _quantity;

   late CartController _cart;

  void setQuantity(bool isIncremented){
    if(isIncremented){
      _quantity = checkQuantity(_quantity + 1);
    }else{
      _quantity = checkQuantity(_quantity-1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (quantity  + _inCartItems < 0) {
         Get.snackbar('Decrement', 'You can\'t reduce more',
          backgroundColor: const Color(0xFFE3F2FD));
         if(_inCartItems > 0){
           quantity = -_inCartItems;
           return quantity;
         }
      return 0;
    } else if (quantity + _inCartItems> 50) {
      Get.snackbar('Increment', 'You can\'t increase more',
          backgroundColor: const Color(0xFFE3F2FD));
      if(_inCartItems >= 1){
        quantity = 50 - _inCartItems;
        return quantity;
      }
      return 50;
    } else {
      return quantity ;
    }
  }
  void initProduct(CartController cart,ProductModel crop){
    _quantity = 0;
    _cart = cart;
    _inCartItems = 0;
     var existsInCart = false;
     existsInCart = _cart.exists(crop);
     if(existsInCart) {
       _inCartItems = _cart.getQuantity(crop);
     }
  }

  void addItem({required String size,required String classification,required CropPricing? cropPricing,required ProductModel crop,required FarmerModel? farmerModel}){
      _cart.addItem(size:size,classification:classification,cropPricing:cropPricing,crop:crop, quantity:_quantity, farmerModel: farmerModel);
      _quantity =0;
      _inCartItems = _cart.getQuantity(crop);
       update();
          }

   int getTotalItems(){
    return _cart.getTotalItems();
   }

   int getQuantity(ProductModel crop){
   return _cart.getQuantity(crop);
   }
}