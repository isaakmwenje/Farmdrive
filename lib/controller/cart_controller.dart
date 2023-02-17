import 'dart:ui';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:Farmdrive/%20repository/cart_repository.dart';
import 'package:Farmdrive/data/cart_model.dart';

import '../data/farmer_model.dart';
import '../data/model/crop_pricing.dart';
import '../data/product_model.dart';

class CartController extends GetxController {
 final CartRepo cartRepo;
 CartController({required this.cartRepo});


  Map<int, Cart> _items = {};
  Map get items => _items;


  List<Cart>  storageItems = [];
  set setStorageItems (List<Cart> cartItems){
    storageItems = cartItems;
    for(var i= 0;i<storageItems.length;i++){
     // print(storageItems[i]);
      items.putIfAbsent(storageItems[i].crop.id, () => storageItems[i]);
    }
  }

  get getCartData{
    setStorageItems = cartRepo.getCartList();
    return storageItems;
  }

  void addItem({required String size,required String classification,required CropPricing? cropPricing,required FarmerModel? farmerModel,required ProductModel crop, required int quantity}) {
    var totalQuantity =0;
    if(farmerModel != null) {
      if (_items.containsKey(crop.id)) {
        _items.update(crop.id!, (value) {
          totalQuantity = quantity + value.quantity;
          if (totalQuantity > 50) {
            Get.snackbar('ItemCount', 'You cannot increase more !!');
          }
          return Cart(
            size:size,
            classification: classification,
            cropPricing: cropPricing,
            farmerModel: farmerModel,
            time: DateTime.now().toString(),
            crop: crop,
            image: value.image,
            quantity: totalQuantity > 50 ? 50 : quantity + value.quantity,
            type: value.type,
            price: 20,
          );
        });
        if (totalQuantity <= 0) {
          _items.remove(crop.id);
        }
      } else {
        if (quantity <= 0) {
          Get.snackbar(
            'itemCount', 'item must be greater than zero',
            backgroundColor: const Color(0xFFE3F2FD),
          );
        } else {
          _items.putIfAbsent(crop.id!, () {
            return Cart(
              size:size,
              classification:classification,
              cropPricing: cropPricing,
              farmerModel: farmerModel,
              time: DateTime.now().toString(),
              crop: crop,
              image: crop.thumbnail!,
              quantity: quantity,
              type: crop.kind!,
              price: 22,
            );
          });
        }
      }
      cartRepo.addToCartList(getItems);
      update();
    }else{
      Get.snackbar(
        'select farmer','Select farmer to proceed'
      );
    }
  }

  int  getQuantity( ProductModel crop){
    var quantity= 0;
      if(_items.containsKey(crop.id)){
        _items.forEach((key, value) {
          if (key == crop.id) {
            quantity = value.quantity;
          }
        });
      }
    return quantity;
  }


  bool exists(ProductModel crop){
    if(_items.containsKey(crop.id)){
      return true;
    }else{
      return false;
    }
  }

  int getTotalItems(){
    var totalItems = 0;
    _items.forEach((key,value){
      totalItems  += value.quantity;
 });
    return totalItems;
}

List<Cart> get getItems {
   return  _items.entries.map((e){
     return  e.value;
    }).toList().reversed.toList();
}

int get getTotal{
    int total = 0;
    _items.forEach((key,value){
      if(value.cropPricing == null || value.cropPricing!.cost == null) {
        total += value.quantity * value.price;
      }else {
        total += value.quantity * value.cropPricing!.cost!;
      }
    });
    return total;
}
void addToCartHistoryList({required int index,required Cart cart}){
    cartRepo.addToCartHistoryList(index);

    remove(cart);
  update();
}




List<Cart> getCartHistory(){
    return cartRepo.getCartHistoryList();
}

 void remove(Cart cart){
    _items.remove(cart.crop.id);
    update();
 }

 void removeCartList(){
    _items = {};
    update();
 }

 clearCart(){
    _items = {};
    cartRepo.remove();
    cartRepo.removeCartHistoryList();
    update();
 }
}