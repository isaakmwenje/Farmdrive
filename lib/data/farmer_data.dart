class  Farmer {
  int farmerId;
  String name;
  String info;
  String phoneNo;
  String location;
  double rating;
  List photos;
  String lastSeen;
  String verified;
  String crop;

  Farmer(
  {
    required this.farmerId,
    required this.crop,
    required this.name,
    required this.info,
   required this.phoneNo,
    required this.location,
    required this.rating,
    required this.photos,
    required this.lastSeen,
    required this.verified,
  }
      );
  Map<String,dynamic> toJson() {
    return {
      'farmerId':farmerId,
      'crop':crop,
      'name':name,
      'info':info,
       'phoneNo':phoneNo,
      'location':location,
      'rating':rating,
      'photos':photos,
      'lastSeen':lastSeen,
      'verified':verified,
    };
  }

  factory Farmer.fromJson(Map<String,dynamic>json){
    return Farmer(
      farmerId: json['farmerId'],
      crop:json['crop'],
      name:json['name'],
      info:json['info'],
      phoneNo:json['phoneNo'],
      rating:json['rating'],
      photos:json['photos'],
      lastSeen:json['lastSeen'],
      verified: json['verified'],
        location: json['location']
    );
  }

}


List<Farmer> farmers = [

  Farmer(
    farmerId :001,
    name:'Lee kigwa',
    info:'wheat farmer,over 15 years experience,good work conduct',
    phoneNo:'07111111111',
    location:'4km away',
    photos:Myphotos,
    rating:4,
    lastSeen:'8 hours ago',
    verified: 'yes',
    crop:'wheat'
  ),
  Farmer(
    farmerId: 002,
    name:'Samuel Kinyajui',
    info:'started maize farming in 2010, hardworking person',
    phoneNo:'07121111111',
    location:'500 M away',
    photos:Myphotos,
    rating:5,
    lastSeen:'32 minutes ago',
    verified:'yes',
    crop:'maize'
  ),
  Farmer(
    farmerId:003,
    name:'Kariuki mbugua',
    info:'professional banana farmer for 24 years , loves farming',
    location:'nyahururu',
    photos:Myphotos,
    rating:3,
    lastSeen:'now',
    verified:'yes',
    phoneNo:'071288888888',
    crop:'banana'
  ),
  Farmer(
    farmerId:004,
    name:'Fedel Otieno',
    info:'produces fresh and quality sukuma and cabbage, responsive person',
    location:'kericho',
    rating: 5,
    lastSeen:'2 hours ago',
    verified:'yes',
    phoneNo: '071212344445',
    photos:Myphotos,
    crop:'sukuma'
  ),

  Farmer(
    farmerId: 005,
    name: 'Vincent Otieno',
    info: 'buy best avocados in the market ,willing to work with all kinds of people',
    location:'salgaa',
    verified:'yes',
    phoneNo:'071234578',
    photos:Myphotos,
    rating: 4,
    lastSeen: 'yesterday',
    crop:'avocados',

  ),

  Farmer(
    farmerId:006,
    name: 'Geofrey Odhiambo',
    info: 'buy best avocados in the market ,willing to work with all kinds of people',
    location:'gilgil',
    verified:'yes',
    phoneNo:'071234578',
    photos:Myphotos,
    rating: 4,
    lastSeen: 'yesterday',
    crop: 'avocados',

  ),

  Farmer(
    farmerId:007,
    name: 'Evil Nyaboke',
    info: 'buy best avocados in the market ,willing to work with all kinds of people',
    location:'darajambili',
    verified:'yes',
    phoneNo:'071234578',
    photos:Myphotos,
    rating: 4,
    lastSeen: 'yesterday',
    crop:'avocados'

  ),

  Farmer(
    farmerId:008,
    name: 'isaak kimani',
    info: 'buy best avocados in the market ,willing to work with all kinds of people',
    location:'naivasha',
    verified:'yes',
    phoneNo:'071234578',
    photos:Myphotos,
    rating: 4,
    lastSeen: 'yesterday',
    crop: 'avocados'
  ),

  Farmer(
    farmerId:009,
    name: 'Juma Okello',
    info: 'buy fresh mangoes in the market ,willing to work with all kinds of people',
    location:'nakuru',
    verified:'yes',
    phoneNo:'071234578',
    photos:Myphotos,
    rating: 4,
    lastSeen: 'yesterday',
    crop:'mangoes'
  ),
  Farmer(
    farmerId:009,
      name: 'Juma Okello',
      info: 'buy fresh mangoes in the market ,willing to work with all kinds of people',
      location:'nakuru',
      verified:'yes',
      phoneNo:'071234578',
      photos:Myphotos,
      rating: 4,
      lastSeen: 'yesterday',
      crop:'mangoes'
  ),Farmer(
    farmerId: 009,
      name: 'Juma Okello',
      info: 'buy fresh mangoes in the market ,willing to work with all kinds of people',
      location:'nakuru',
      verified:'yes',
      phoneNo:'071234578',
      photos:Myphotos,
      rating: 4,
      lastSeen: 'yesterday',
      crop:'mangoes'
  ),
  Farmer(
      farmerId: 009,
      name: 'Juma Okello',
      info: 'buy fresh mangoes in the market ,willing to work with all kinds of people',
      location:'nakuru',
      verified:'yes',
      phoneNo:'071234578',
      photos:Myphotos,
      rating: 4,
      lastSeen: 'yesterday',
      crop:'mangoes'
  ),
  Farmer(
    farmerId:009,
      name: 'Juma Okello',
      info: 'buy fresh mangoes in the market ,willing to work with all kinds of people',
      location:'nakuru',
      verified:'yes',
      phoneNo:'071234578',
      photos:Myphotos,
      rating: 4,
      lastSeen: 'yesterday',
      crop:'mangoes'
  ),
  Farmer(
    farmerId:009,
      name: 'Juma Okello',
      info: 'buy fresh mangoes in the market ,willing to work with all kinds of people',
      location:'nakuru',
      verified:'yes',
      phoneNo:'071234578',
      photos:Myphotos,
      rating: 4,
      lastSeen: 'yesterday',
      crop:'mangoes'
  ),
  Farmer(
      farmerId: 009,
      name: 'Juma Okello',
      info: 'buy fresh mangoes in the market ,willing to work with all kinds of people',
      location:'nakuru',
      verified:'yes',
      phoneNo:'071234578',
      photos:Myphotos,
      rating: 4,
      lastSeen: 'yesterday',
      crop:'mangoes'
  ),
  Farmer(
      farmerId: 009,
      name: 'Juma Okello',
      info: 'buy fresh mangoes in the market ,willing to work with all kinds of people',
      location:'nakuru',
      verified:'yes',
      phoneNo:'071234578',
      photos:Myphotos,
      rating: 4,
      lastSeen: 'yesterday',
      crop:'mangoes'
  ),
  Farmer(
    farmerId: 010,
      name: 'Marks Mbuthia',
      info: 'buy fresh mangoes in the market ,willing to work with all kinds of people',
      location:'nakuru',
      verified:'yes',
      phoneNo:'071234578',
      photos:Myphotos,
      rating: 4,
      lastSeen: 'yesterday',
      crop:'unripe banana'
  ),
  Farmer(
      farmerId: 011,
      name: 'Catherine Njeri',
      info: 'buy fresh mangoes in the market ,willing to work with all kinds of people',
      location:'nakuru',
      verified:'yes',
      phoneNo:'071234578',
      photos:Myphotos,
      rating: 4,
      lastSeen: 'yesterday',
      crop:'tomatoes'
  ),
  Farmer(
      farmerId: 012,
      name: 'Stacy Nafula',
      info: 'buy fresh mangoes in the market ,willing to work with all kinds of people',
      location:'nakuru',
      verified:'yes',
      phoneNo:'071234578',
      photos:Myphotos,
      rating: 4,
      lastSeen: 'yesterday',
      crop:'sukuma'
  ),
  Farmer(
     farmerId: 013,
      name: 'Juma Okello',
      info: 'buy fresh mangoes in the market ,willing to work with all kinds of people',
      location:'nakuru',
      verified:'yes',
      phoneNo:'071234578',
      photos:Myphotos,
      rating: 4,
      lastSeen: 'yesterday',
      crop:'spinach'
  ),
  Farmer(
      farmerId: 014,
      name: 'Sharon Igethwe',
      info: 'buy fresh mangoes in the market ,willing to work with all kinds of people',
      location:'nakuru',
      verified:'yes',
      phoneNo:'071234578',
      photos:Myphotos,
      rating: 4,
      lastSeen: 'yesterday',
      crop:'mangoes'
  ),
  Farmer(
      farmerId: 009,
      name: 'Juma Okello',
      info: 'buy fresh mangoes in the market ,willing to work with all kinds of people',
      location:'nakuru',
      verified:'yes',
      phoneNo:'071234578',
      photos:Myphotos,
      rating: 4,
      lastSeen: 'yesterday',
      crop:'pumpkin'
  ),
  Farmer(
      farmerId: 015,
      name: 'Judas TheLast',
      info: 'buy fresh mangoes in the market ,willing to work with all kinds of people',
      location:'nakuru',
      verified:'yes',
      phoneNo:'071234578',
      photos:Myphotos,
      rating: 4,
      lastSeen: 'yesterday',
      crop:'onions'
  ),
  Farmer(
      farmerId:016,
      name: 'Jayden Steve',
      info: 'buy fresh mangoes in the market ,willing to work with all kinds of people',
      location:'nakuru',
      verified:'yes',
      phoneNo:'071234578',
      photos:Myphotos,
      rating: 4,
      lastSeen: 'yesterday',
      crop:'ginger'
  ),
  Farmer(
      farmerId:017,
      name: 'Felix Okello',
      info: 'buy fresh mangoes in the market ,willing to work with all kinds of people',
      location:'nakuru',
      verified:'yes',
      phoneNo:'071234578',
      photos:Myphotos,
      rating: 4,
      lastSeen: 'yesterday',
      crop:'garlic'
  ),
  Farmer(
      farmerId: 017,
      name: 'Felix Okello',
      info: 'buy fresh mangoes in the market ,willing to work with all kinds of people',
      location:'nakuru',
      verified:'yes',
      phoneNo:'071234578',
      photos:Myphotos,
      rating: 4,
      lastSeen: 'yesterday',
      crop:'cucumber'
  ),
  Farmer(
      farmerId:018,
      name: 'Susan ngugi',
      info: 'buy fresh mangoes in the market ,willing to work with all kinds of people',
      location:'nakuru',
      verified:'yes',
      phoneNo:'071234578',
      photos:Myphotos,
      rating: 4,
      lastSeen: 'yesterday',
      crop:'coriander'
  ),
  Farmer(
      farmerId:019,
      name: 'Lucy watetu',
      info: 'buy fresh mangoes in the market ,willing to work with all kinds of people',
      location:'nakuru',
      verified:'yes',
      phoneNo:'071234578',
      photos:Myphotos,
      rating: 4,
      lastSeen: 'yesterday',
      crop:'chilli pepper'
  ),
  Farmer(
      farmerId:020,
      name: 'Fiona ngugi',
      info: 'buy fresh mangoes in the market ,willing to work with all kinds of people',
      location:'nakuru',
      verified:'yes',
      phoneNo:'071234578',
      photos:Myphotos,
      rating: 4,
      lastSeen: 'yesterday',
      crop:'cauliflower'
  ),
  Farmer(
     farmerId:021,
      name: 'Morris kishente',
      info: 'buy fresh mangoes in the market ,willing to work with all kinds of people',
      location:'nakuru',
      verified:'yes',
      phoneNo:'071234578',
      photos:Myphotos,
      rating: 4,
      lastSeen: 'yesterday',
      crop:'cabbage'
  ),
  Farmer(
      farmerId: 022,
      name: 'Richard munyoki',
      info: 'buy fresh mangoes in the market ,willing to work with all kinds of people',
      location:'nakuru',
      verified:'yes',
      phoneNo:'071234578',
      photos:Myphotos,
      rating: 4,
      lastSeen: 'yesterday',
      crop:'brocolli'
  ),
  Farmer(
      farmerId:009,
      name: 'Juma Okello',
      info: 'buy fresh mangoes in the market ,willing to work with all kinds of people',
      location:'nakuru',
      verified:'yes',
      phoneNo:'071234578',
      photos:Myphotos,
      rating: 4,
      lastSeen: 'yesterday',
      crop:''
  ),
  Farmer(
      farmerId:023,
      name: 'Ann nyaboke',
      info: 'buy fresh mangoes in the market ,willing to work with all kinds of people',
      location:'nakuru',
      verified:'yes',
      phoneNo:'071234578',
      photos:Myphotos,
      rating: 4,
      lastSeen: 'yesterday',
      crop:'carrot'
  ),
  Farmer(
      farmerId:024,
      name: 'Mike kibwazi',
      info: 'buy fresh mangoes in the market ,willing to work with all kinds of people',
      location:'nakuru',
      verified:'yes',
      phoneNo:'071234578',
      photos:Myphotos,
      rating: 4,
      lastSeen: 'yesterday',
      crop:'bell pepper'
  ),
  Farmer(
      farmerId:025,
      name: 'Steve hatkins',
      info: 'buy fresh mangoes in the market ,willing to work with all kinds of people',
      location:'nakuru',
      verified:'yes',
      phoneNo:'071234578',
      photos:Myphotos,
      rating: 4,
      lastSeen: 'yesterday',
      crop:'bell pepper'
  ),

];
List Myphotos = [];
