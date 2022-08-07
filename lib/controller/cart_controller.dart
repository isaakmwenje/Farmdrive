import 'dart:ui';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:untitled3/%20repository/cart_repository.dart';
import 'package:untitled3/data/cart_model.dart';
import 'package:untitled3/data/crop_data.dart';
import 'package:untitled3/data/farmer_data.dart';

class CartController extends GetxController {
 final CartRepo cartRepo;
 CartController({required this.cartRepo});


  Map<String, Cart> _items = {};
  Map get items => _items;


  List<Cart>  storageItems = [];
  set setStorageItems (List<Cart> cartItems){
    storageItems = cartItems;
    for(var i= 0;i<storageItems.length;i++){
      print(storageItems[i]);
      items.putIfAbsent(storageItems[i].crop.type, () => storageItems[i]);
    }
  }

  get getCartData{
    setStorageItems = cartRepo.getCartList();
    return storageItems;
  }

  void addItem({required Farmer? farmer,required Crop crop, required int quantity}) {
    var totalQuantity =0;
    if(farmer != null) {
      if (_items.containsKey(crop.type)) {
        _items.update(crop.type, (value) {
          totalQuantity = quantity + value.quantity;
          if (totalQuantity > 50) {
            Get.snackbar('ItemCount', 'You cannot increase more !!');
          }
          return Cart(
            farmer: farmer,
            time: DateTime.now().toString(),
            crop: crop,
            image: value.image,
            quantity: totalQuantity > 50 ? 50 : quantity + value.quantity,
            type: value.type,
            price: value.price,
          );
        });
        if (totalQuantity <= 0) {
          _items.remove(crop.type);
        }
      } else {
        if (quantity <= 0) {
          Get.snackbar(
            'itemCount', 'item must be greater than zero',
            backgroundColor: const Color(0xFFE3F2FD),
          );
        } else {
          _items.putIfAbsent(crop.type, () {
            return Cart(
              farmer: farmer,
              time: DateTime.now().toString(),
              crop: crop,
              image: crop.image,
              quantity: quantity,
              type: crop.type,
              price: crop.price,
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

  int  getQuantity( Crop crop){
    var quantity= 0;
      if(_items.containsKey(crop.type)){
        _items.forEach((key, value) {
          if (key == crop.type) {
            quantity = value.quantity;
          }
        });
      }
    return quantity;
  }


  bool exists(Crop crop){
    if(_items.containsKey(crop.type)){
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
      total += value.quantity * value.price;
    });
    return total;
}
void addToCartHistoryList({required int index,required Crop crop}){
    cartRepo.addToCartHistoryList(index);
    remove(crop);

}
List<Cart> getCartHistory(){
    return cartRepo.getCartHistoryList();
}

 void remove(Crop crop){
    _items.remove(crop.type);
    update();
 }

}