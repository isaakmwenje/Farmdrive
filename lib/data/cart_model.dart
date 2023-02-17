import 'package:Farmdrive/data/product_model.dart';

import 'crop_data.dart';
import 'farmer_model.dart';
import 'model/crop_pricing.dart';

class Cart{
  CropPricing? cropPricing;
  ProductModel  crop;
  String  image;
  String  type;
  int price;
  int quantity;
  String time;
  FarmerModel farmerModel;
  String size;
  String classification;

  Cart(
      {
        required this.size,
        required this.classification,
        required this.cropPricing,
        required this.farmerModel,
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
      'size':size,
      'classification':classification,
      'farmerModel':farmerModel,
      'time':DateTime.now().toString(),
      'crop':crop.toJson(),
    'type':type,
    'price':price,
    'image':image,
    'quantity':quantity,
      'cropPricing':cropPricing,
  };
}

 factory Cart.fromJson(Map<String,dynamic> json) {
   return Cart(
     size:json['classification'],
     classification:json['classification'],
     cropPricing: json['cropPricing'] != null? CropPricing.fromJson(json['cropPricing']):null,
     farmerModel:FarmerModel.fromJson(json['farmerModel']),
     time: json['time'],
     crop : ProductModel.fromJson(json['crop']),
     image: json['image'],
     type : json['type'],
     price : json['price'],
     quantity : json['quantity'],
   );
 }

}