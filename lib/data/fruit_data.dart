

import 'crop_data.dart';

class Fruit implements Crop {

  String type;
  int price;
  String sellers;
  String image;
  int quantity;
  var kind;
  var size;
  var state;

  Fruit({
    required this.category,
    required this.quantity,
    required this.image,
   required  this.type,
   required this.price,
    required this.sellers,
    this.kind,
    this.size,
    this.state,
});

  @override
  Map<String, dynamic> toJson() {
    return{
      'type':this.type,
      'price':this.price,
      'image':this.image,
      'quantity':this.quantity,
    };
  }

  @override
  String category;
  }

  List<Fruit> fruits = [

     Fruit(
       category:'Fruit',
       quantity:0,
      image:'assets/fruits/apple.jpg',
     type:'apple',
      price: 20,
      sellers :'11',
       kind:['red-delicious','green','mixed'],
       state:['under-ripe','ripe','over-ripe']
     ),

    Fruit(
        category:'Fruit',
        quantity:0,
      image:'assets/fruits/aushguard.jpg',
      type: 'aush guard',
      price: 10,
      sellers:'8'
    ),
    Fruit(
        category:'Fruit',
        quantity:0,
      image:'assets/fruits/avocado.jpg',
      type:'avocado',
      price: 20,
      sellers: '9',
      size:['large','medium','small'],
        state:['under-ripe','ripe','over-ripe']
    ),
    Fruit(
      category:'Fruit',
      quantity:0,
      image:'assets/fruits/banana.jpg',
      type:'banana',
      price:5,
      sellers:'33',
      size:['small-banana','medium-banana','large'],
    ),
    Fruit(
        category:'Fruit',
      quantity:0,
      image:'assets/fruits/coconut.jpg',
      type: 'coconut',
      price: 20,
      sellers:'3',
      size:['small-banana','medium-banana','large'],
        state:['under-ripe','ripe','over-ripe']
    ),
    Fruit(
      category:'Fruit',
        quantity:0,
      image:'assets/fruits/date.jpg',
      type:'date',
      price:25,
      sellers:'11',

    ),
    Fruit(
        category:'Fruit',
      quantity:0,
      image:'assets/fruits/guava.jpeg',
      type:'guava',
      price:30,
      sellers: '11',
      kind:['white','pink']
    ),
    Fruit(
        category:'Fruit',
      quantity:0,
      image:'assets/fruits/hyuganatsu.jpeg',
      type:'hyuganatsu',
      price:20,
      sellers:'22',
        state:['under-ripe','ripe','over-ripe']
    ),
    Fruit(category:'Fruit',
      quantity: 0,
      image:'assets/fruits/lemon.jpg',
      type:'lemon',
      price: 5,
      sellers:'12',
        state:['under-ripe','ripe','over-ripe']

    ),
    Fruit(
      category:'Fruit',
      quantity: 0,
      image:'assets/fruits/mango.jpeg',
      type:"mango",
      price: 5,
      sellers:'13',
      size:['medium','large'],
        state:['under-ripe','ripe','over-ripe'],
    ),
    Fruit(
      category:'Fruit',
      quantity:0,
      image:'assets/fruits/orange.jpg',
      type:'orange',
      price:5,
      sellers:'14',
      size:['medium','large'],
        state:['under-ripe','ripe','over-ripe'],
    ),
    Fruit(
      category:'Fruit',
      quantity:0,
      image:'assets/fruits/papaya.jpg',
      type:'paw paw',
      price:15,
      sellers:'15',
      size:['medium','large'],
        state:['under-ripe','ripe','over-ripe'],
    ),
    Fruit(
        category:'Fruit',
      quantity: 0,
      image:'assets/fruits/peer.jpeg',
      type:'peer',
      price:5,
      sellers:'12',
      size:['medium','large'],
        state:['under-ripe','ripe','over-ripe']
    ),
    Fruit(
        category:'Fruit',
      quantity: 0,
      image:'assets/fruits/pineapple.jpg',
      type:'pineapple',
      price: 30,
      sellers: '3',
      size:['medium','large'],
        state:['under-ripe','ripe','over-ripe']
    ),
    Fruit(
        category:'Fruit',
      quantity: 0,
      image:'assets/fruits/strawberry-.jpeg',
      type:'strawberry',
      price:30,
      sellers: '1'
    ),
    Fruit(
        category:'Fruit',
      quantity:0,
      image:'assets/fruits/watermelon.jpeg',
      type:'watermelon',
      price: 60,
      sellers:'12',
      size:['medium','large'],
        state:['under-ripe','ripe','over-ripe']
    )

  ];