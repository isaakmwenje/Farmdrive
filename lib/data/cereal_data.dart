import 'crop_data.dart';

class Cereal implements Crop{

  String  image;
  String  type;
  int price;
  int quantity;
  var  kind;
  var granularity;
  var size;
  Cereal(
  {
    required this.category,
    required this.quantity,
    required this.image,
    required this.type,
    required this.price,
    this.granularity,
    this.size,
    this.kind,
}
  );

  @override
  Map<String, dynamic> toJson() {
    return{
      'type':this.type,
      'price':this.price,
      'image':this.image,
      'quantity':this.quantity,
      'category':this.category,
    };
  }

  @override
  String category;
}

List<Cereal> cereals = [

  Cereal(
    category:'Cereal',
    quantity:0,
    image:'assets/cereals/beans.jpg',
    type:'beans',
    price:40,
    granularity:['fine','impure'],
  ),

  Cereal(
    category:'Cereal',
    quantity:0,
    image:'assets/cereals/black_beans.jpg',
    type: 'black beans',
    price: 40,
    granularity:['fine','impure'],
  ),
  Cereal(
    category:'Cereal',
      quantity:0,
    image:'assets/cereals/greengrams.jpeg',
    type:'green grams',
    price:20,
    granularity:['fine','impure'],
  ),
  Cereal(
    category:'Cereal',
    quantity:0,
    image:'assets/cereals/maize.jpg',
    type:'maize',
    price:35,
    granularity:['fine','impure'],
  ),
  Cereal(
    category:'Cereal',
    quantity:0,
    image:'assets/cereals/millet2.jpeg',
    type:'millet',
    price:25,
    granularity:['fine','impure'],
  ),
  Cereal(
    category:'Cereal',
    quantity:0,
    image:'assets/cereals/oats.jpg',
    type: 'peas',
    price:40,
    granularity:['fine','impure'],
  ),
  Cereal(
    category:'Cereal',
      quantity:0,
    image:'assets/cereals/peanut.jpeg',
    type: 'peanut',
    price: 35,
    granularity:['fine','impure'],
  ),
  Cereal(
    category:'Cereal',
    quantity:0,
    image:'assets/cereals/potatoes.webp',
    type:'potatoes',
    price:25,
    size:['large','medium','small'],
  ),
  Cereal(
      category:'Cereal',
    quantity:0,
    image:'assets/cereals/rice.jpg',
    type:'rice',
    price:50,
    granularity:['fine','impure'],
    kind:['brown','black','basmati','jasmine','white','aromatic']
  ),
  Cereal(
      category:'Cereal',
    quantity:0,
    image:'assets/cereals/sorghum.jpg',
    type:'sorghum',
    price:40,
    granularity:['fine','impure'],
    kind:['grain','sweet','forage']
  ),
  Cereal(
      category:'Cereal',
    quantity:0,
    image:'assets/cereals/wheat.jpg',
    type: 'wheat',
    price:35,
    granularity:['fine','impure'],
    kind:['hard','soft','durum']
  )
];