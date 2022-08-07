import 'crop_data.dart';
import 'farmer_data.dart';

class Cart{
  Crop  crop;
  String  image;
  String  type;
  int price;
  int quantity;
  String time;
  Farmer farmer;

  Cart(
      {
        required this.farmer,
        required this.time,
        required this.crop,
        required this.image,
        required this.type,
        required this.price,
        required this.quantity,
      }
      );


  Map<String,dynamic> toJson(){
    return{
      'farmer':farmer,
      'time':DateTime.now().toString(),
    'crop':crop.toJson(),
    'type':type,
    'price':price,
    'image':image,
    'quantity':quantity,
  };
}

 factory Cart.fromJson(Map<String,dynamic> json) {
   return Cart(
     farmer:Farmer.fromJson(json['farmer']),
     time: json['time'],
     crop : Crop. fromJson(json['crop']),
     image: json['image'],
     type : json['type'],
     price : json['price'],
     quantity : json['quantity'],
   );
 }

}