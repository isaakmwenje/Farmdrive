import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled3/data/cart_model.dart';

class CartRepo
{

 final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cartList = [];
  List<String> historyCartList = [];

  void addToCartList(List<Cart> cartItems ){
    cartList = [];
    var time = DateTime.now().toString();
    for (var element in cartItems) {
      element.time = time;
      cartList.add(jsonEncode(element));
    }
    sharedPreferences.setStringList('cartList',cartList);
  }

  List<Cart> getCartList(){
    List<Cart> cartItems = [];
    //sharedPreferences.remove('cartList');
    //sharedPreferences.remove('historyCartList');
    if(sharedPreferences.containsKey('cartList')){
      cartList = sharedPreferences.getStringList('cartList')!;
    }
    for(var element in cartList) {
      cartItems.add(Cart.fromJson(jsonDecode(element)));
    }
    return cartItems;
  }

 void addToCartHistoryList(int index){
    List cartItems = [];
    final time = DateTime.now().toString();
    for(var element in cartList){
      cartItems.add(Cart.fromJson(jsonDecode(element)));
    }

    for(var element in cartItems){
      element.time = time;
    }

    for(int i=0;i<cartList.length;i++){
      if(i == index) {
        historyCartList.add(cartList[i]);
      }
    }
    sharedPreferences.setStringList('historyCartList',historyCartList);
    //getCartHistoryList();
    remove();
 }

 List<Cart> getCartHistoryList() {
   List<Cart> historyCartItems = [];
   if (sharedPreferences.containsKey('historyCartList')) {
     historyCartList = sharedPreferences.getStringList('historyCartList')!;
   }
     historyCartList.forEach((element) {
       historyCartItems.add(Cart.fromJson(jsonDecode(element)));
     });
   return historyCartItems;
 }

 void remove(){
    cartList = [];
    sharedPreferences.remove('cartList');
 }

}