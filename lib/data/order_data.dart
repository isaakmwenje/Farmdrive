

import 'cereal_data.dart';
import 'farmer_data.dart';
import 'fruit_data.dart';
import 'vegetable_data.dart';

class Order {
  Fruit? fruit;
  Vegetable? vegetable;
  Cereal? cereal;
  Farmer  farmer;
  String orderId;
  String quantity;
  int amount;
  int shippingAmount;
  String time;
  String date;
  String shippingAddress;

  Order({
    this.fruit,
    this.vegetable,
    this.cereal,
    required this.farmer,
    required this.orderId,
    required this.quantity,
    required this.amount,
    required this.shippingAmount,
    required this.time,
    required this.date,
    required this.shippingAddress,
});
}

List<Order> orders = [
  Order(
    fruit: fruits[0],
    farmer:farmers[0],
    orderId:'001',
    quantity: '2kg',
    amount:1249,
    shippingAmount:250,
    shippingAddress:'Wright Benson plaza 22',
    time:'10:08',
    date: '01/10/2022',
  ),

  Order(
    fruit: fruits[0],
    farmer:farmers[0],
    orderId:'001',
    quantity: '2kg',
    amount:1249,
    shippingAmount:250,
    shippingAddress:'Wright Benson plaza 22',
    time:'10:08',
    date: '01/10/2022',
  ),

  Order(
    fruit: fruits[1],
    farmer:farmers[1],
    orderId:'001',
    quantity: '2kg',
    amount:1249,
    shippingAmount:250,
    shippingAddress:'Wright Benson plaza 22',
    time:'10:08',
    date: '01/10/2022',
  ),

  Order(
    fruit: fruits[2],
    farmer:farmers[2],
    orderId:'001',
    quantity: '2kg',
    amount:1249,
    shippingAmount:250,
    shippingAddress:'Wright Benson plaza 22',
    time:'10:08',
    date: '01/10/2022',
  ),

  Order(
    cereal:cereals[3],
    farmer:farmers[3],
    orderId:'001',
    quantity: '2kg',
    amount:1249,
    shippingAmount:250,
    shippingAddress:'Wright Benson plaza 22',
    time:'10:08',
    date: '01/10/2022',
  ),

  Order(
    vegetable: vegetables[4],
    farmer:farmers[4],
    orderId:'001',
    quantity: '2kg',
    amount:1249,
    shippingAmount:250,
    shippingAddress:'Wright Benson plaza 22',
    time:'10:08',
    date: '01/10/2022',
  ),

  Order(
    fruit:fruits[5],
    farmer:farmers[5],
    orderId:'001',
    quantity: '2kg',
    amount:1249,
    shippingAmount:250,
    shippingAddress:'Wright Benson plaza 22',
    time:'10:08',
    date: '01/10/2022',
  ),

  Order(
    cereal:cereals[0],
    farmer:farmers[0],
    orderId:'001',
    quantity: '2kg',
    amount:1249,
    shippingAmount:250,
    shippingAddress:'Wright Benson plaza 22',
    time:'10:08',
    date: '01/10/2022',
  ),

  Order(
    vegetable: vegetables[8],
    farmer:farmers[8],
    orderId:'001',
    quantity: '2kg',
    amount:1249,
    shippingAmount:250,
    shippingAddress:'Wright Benson plaza 22',
    time:'10:08',
    date: '01/10/2022',
  ),

];


