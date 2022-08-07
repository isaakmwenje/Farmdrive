import 'crop_data.dart';

class  Vegetable implements Crop{
  @override
  String image;
  @override
  String type;
  int price;
  String description;
  int quantity;
  var  state;
  var  kind;
  var size;


  Vegetable({
    required this.category,
    required this.quantity,
    required this.image,
    required this.type,
    required this.price,
    required this.description,
    this.state,
    this.kind,
    this.size,
});

  @override
  Map<String, dynamic> toJson() {
    return{
      'category':this.category,
      'type':this.type,
      'price':this.price,
      'image':this.image,
      'quantity':this.quantity,
    };
  }

  @override
  String category;


}


List<Vegetable> vegetables = [

  Vegetable(
    category:'Vegetable',
    quantity:0,
   image:  'assets/carrot.jpeg',
    type:'carrot',
    price:10,
    description:'Carrot is reffered to as Karoti in swahili.The carrots are '
        'packed in rafia bags for easier delivery ',
      state:['under-ripe','ripe','over-ripe'],
    size:['small','medium'],
  ),

  Vegetable(
    category:'Vegetable',
      quantity:0,
    image:'assets/bellpepper.jpeg',
    type :'bell pepper',
    price:20,
    description:'Pilipili hoho (swahili) is weighed as six  pieces per kg.There '
        'used in garden salads and toppings such as pizza',
      state:['under-ripe','ripe','over-ripe'],
    size:['small','medium'],
  ),

  Vegetable(
    category:'Vegetable',
      quantity:0,
    image:'assets/brocolli.jpeg',
    type:'brocolli',
    price:200,
    description: 'Broccoli is used to prepare broccoli dishes.Broccoli provides '
        'several healthy benefits.It provides lower blood sugar and improves '
        'bowel movement',
      state:['under-ripe','ripe','over-ripe'],
  ),

  Vegetable(
    category:'Vegetable',
      quantity:0,
    image:'assets/cabbage.jpg',
    type:'cabbage',
    price: 50,
    description:'Kabichi is weighed as two pieces per kg. Cabbage is a low-calorie'
      'vegetable that is rich in vitamins, minerals and antioxidants.',
    size:['small','medium','large'],
  ),

  Vegetable(
    category:'Vegetable',
    quantity:0,
    image: 'assets/cauliflower.jpeg',
    type:'cauliflower',
    price:60,
    description:'Cauliflower weighed as two pieces per kg. '
      ' Cooked and used in soups, rice, curries, gobi '
        'parathas ',
    size:['small','medium','large'],
),
    Vegetable(
      category:'Vegetable',
      quantity:0,
      image:'assets/chillipepper.jpeg',
      type: 'chilli pepper',
      price:10,
      description: 'Pilipili as  in swahili is used as a spice vegetable',
      kind:['red','yellow','green','mixed'],
        state:['under-ripe','ripe','over-ripe'],
      size:['small','medium'],
    ),


  Vegetable(
    category:'Vegetable',
      quantity:0,
    image:'assets/coriander.jpg',
    type:'coriander',
    price:10,
    description:'Coriander is usually reffered to as dania in swahili.Coriander '
        'is a herb used to flavor dishes',
      state:['ripe','stale'],
  ),

  Vegetable(
      category:'Vegetable',
      quantity:0,
    image: 'assets/cucumber.jpeg',
    type :'cucumber',
    price:10,
    description:'Cucumbers are low in calories but high in water and several '
        'important vitamins and minerals. Eating cucumbers with the peel '
        'provides the maximum amount of nutrients.',
      state:['under-ripe','ripe','over-ripe'],
    size:['small','medium','large']
  ),


  Vegetable(
      category:'Vegetable',
      quantity:0,
    image:'assets/garlic.jpeg',
    type:'garlic',
    price:10,
    description:' Garlic is most often used as a flavoring agent but can also '
        'be eaten as a vegetable. It is used to flavor many foods, such as salad'
        ' dressings, vinaigrettes, marinades, sauces, vegetables, meats, soups, '
        'and stews.',
      size:['small','medium','large']
  ),

  Vegetable(
      category:'Vegetable',
      quantity:0,
    image:'assets/ginger.jpeg',
    type:'ginger',
    price:10,
    description:'Ginger is used as a food flavoring and medicine.',
      size:['small','medium','large']
  ),

  Vegetable(
      category:'Vegetable',
      quantity:0,
    image: 'assets/mushroom.png',
    type:'mushroom',
    price:250,
    description:'Mushrooms can be a healthful addition to a varied diet.'
        ' They are easy to prepare and provide a range of nutrients.'
  ),

  Vegetable(
    category:'Vegetable',
      quantity:0,
    image: 'assets/onions.jpg',
    type: 'onions',
    price:10,
    description:'Onions are sliced thinly or chopped and served raw in salads, ',
      size:['small','medium','large'],
  ),

  Vegetable(
    category:'Vegetable',
      quantity:0,
    image:'assets/pumpkin.jpg',
    type:'pumpkin',
    price:60,
    description:'Nutrients in pumpkin seeds may help keep your heart healthy by'
        ' reducing blood pressure and increasing good cholesterol.',
      state:['under-ripe','ripe','over-ripe'],
      size:['small','medium','large'],
  ),

  Vegetable(
      category:'Vegetable',
      quantity:0,
    image:'assets/spinach.jpeg',
    type:'spinach',
    price:10,
    description:'Spinach has vitamins and minerals like vitamin E and magnesium '
        'that support your immune system. This system keeps you safe from'
        ' viruses and bacteria that cause disease. It also defends your body '
        'from other things that can hurt you, like toxins.'
  ),

  Vegetable(
      category:'Vegetable',
      quantity:0,
    image:'assets/sukuma.jpg',
    type:'sukuma',
    price:10,
    description:'Kale is a green, leafy vegetable that provides a wide range of'
        ' nutrients. It is a healthful addition to a varied diet, and people can'
        ' use it in numerous ways.'
  ),
  Vegetable(
      category:'Vegetable',
      quantity:0,
    image:'assets/tomato@2x.jpg',
    type:'tomatoes',
    price:10,
    description:'Tomatoes are the major dietary source of the antioxidant'
        ' lycopene, which has been linked to many health benefits, including'
        ' reduced risk of heart disease and cancer.',
      state:['under-ripe','ripe','over-ripe'],
      size:['small','medium','large']
  ),

  Vegetable(
      category:'Vegetable',
      quantity:0,
    image:'assets/unripebanana.jpeg',
    type: 'unripe banana',
    price: 10,
    description:'Unripe bananas are also rich in resistant starch and pectin, '
        'which can provide numerous health benefits.',
      size:['small','medium','large']

  )


];





