class Crop{

  String  image;
  String  type;
  String  category;
  int price;
  int quantity;
  Crop(
      {
        required this.category,
        required this.quantity,
        required this.image,
        required this.type,
        required this.price,
      }
      );

  Map<String,dynamic> toJson(){
    return {
      'category':category,
      'image':image,
      'quantity':quantity,
      'type':type,
      'price':price,
    };
  }

  factory Crop.fromJson(Map<String,dynamic> json) {
    return Crop(
      category:json['category'],
      image: json['image'],
      type : json['type'],
      price : json['price'],
      quantity : json['quantity'],
    );
  }
}