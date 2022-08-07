import 'package:flutter/material.dart';
import 'package:untitled3/presentation/widget/farmer_category.dart';
import 'package:untitled3/presentation/widget/farmers_caoresel.dart';
import 'package:untitled3/presentation/widget/farmers_cereal_caoresel.dart';
import 'package:untitled3/presentation/widget/farmers_fruit_couresel.dart';
import 'package:untitled3/presentation/widget/farmers_vegetable_couresel.dart';

class LocatorScreen extends StatefulWidget {
  const LocatorScreen({Key? key}) : super(key: key);

  @override
  _LocatorScreenState createState() => _LocatorScreenState();
}

class _LocatorScreenState extends State<LocatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height:220,
                  width:340,
                  color:Colors.green,
                  child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:const[
                        CircleAvatar(
                          radius:30,
                        ),
                        SizedBox(width:15),
                        Text(
                            "UserName",
                            style:TextStyle(
                              color:Colors.white,
                              fontSize:18,
                              letterSpacing:1.4,
                            )
                        )
                      ]
                  )
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child:  Text(
                    'ACCOUNT',
                    style:TextStyle(
                      color:Colors.black54,
                      fontWeight:FontWeight.bold,
                      letterSpacing:1.2,
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:12),
                child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.person_add,
                          ),
                          SizedBox(width: 10,),
                          Text(
                              'Sign Up',
                              style:TextStyle(
                                letterSpacing:1.2,
                                fontWeight:FontWeight.w500,
                                fontSize:18,
                              )
                          )
                        ],),
                      const SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.smartphone_outlined,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: const [
                              Text(
                                  'Contact',
                                  style:TextStyle(
                                    letterSpacing:1.2,
                                    fontWeight:FontWeight.w500,
                                    fontSize:18,
                                  )
                              ),
                              SizedBox(height: 3.0),
                              Text(
                                  'phone no',
                                  style:TextStyle(
                                    color:Colors.black45,
                                    letterSpacing:1.2,
                                    fontWeight:FontWeight.w500,
                                    fontSize:15,
                                  )
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.location_on,
                          ),
                          const SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                  'Location',
                                  style:TextStyle(
                                    letterSpacing:1.2,
                                    fontWeight:FontWeight.w500,
                                    fontSize:18,
                                  )
                              ),
                              SizedBox(height: 3),
                              Text(
                                  'address',
                                  style:TextStyle(
                                    color:Colors.black45,
                                    letterSpacing:1.2,
                                    fontWeight:FontWeight.w500,
                                    fontSize:15,
                                  )
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.alternate_email_sharp,
                            ),
                            const SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                    'Username',
                                    style:TextStyle(
                                      letterSpacing:1.2,
                                      fontWeight:FontWeight.w500,
                                      fontSize:18,
                                    )
                                ),
                                SizedBox(height:3),
                                Text(
                                    'name',
                                    style:TextStyle(
                                      color:Colors.black45,
                                      letterSpacing:1.2,
                                      fontWeight:FontWeight.w500,
                                      fontSize:15,
                                    )
                                ),

                              ],
                            )
                          ]
                      ),
                    ]
                ),
              ),
              const SizedBox(height: 16,),
              const Padding(
                padding: EdgeInsets.only(left:8.0,bottom:8.0),
                child: Text(
                    'NOTIFICATIONS',
                    style:TextStyle(
                      color:Colors.black54,
                      fontWeight:FontWeight.bold,
                      letterSpacing:1.2,
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.shopping_cart,
                        ),
                        SizedBox(width: 10,),
                        Text(
                            'Cart',
                            style:TextStyle(
                              letterSpacing:1.2,
                              fontWeight:FontWeight.w500,
                              fontSize:18,
                            )
                        )
                      ],),
                    SizedBox(height: 20,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.group,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: const [
                            Text(
                                'Favorites',
                                style:TextStyle(
                                  letterSpacing:1.2,
                                  fontWeight:FontWeight.w500,
                                  fontSize:18,
                                )
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 16,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.check_box,
                        ),
                        const SizedBox(width: 10,),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                  'Delivery',
                                  style:TextStyle(
                                    letterSpacing:1.2,
                                    fontWeight:FontWeight.w500,
                                    fontSize:18,
                                  )
                              ),
                            ] ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height:16),
              const Padding(
                padding:  EdgeInsets.only(left:8.0,bottom:8.0),
                child: Text(
                    'SETTINGS',
                    style:TextStyle(
                      color:Colors.black54,
                      fontWeight:FontWeight.bold,
                      letterSpacing:1.2,
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.star,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                            'Preferences',
                            style:TextStyle(
                              letterSpacing:1.2,
                              fontWeight:FontWeight.w500,
                              fontSize:18,
                            )
                        ),
                        SizedBox(height: 3,),
                        Text(
                            'set calls preferences',
                            style:TextStyle(
                              color:Colors.black45,
                              letterSpacing:1.2,
                              fontWeight:FontWeight.w500,
                              fontSize:15,
                            )
                        ),
                      ],
                    )
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(left:8.0,top:16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                      'HELP',
                      style:TextStyle(
                        letterSpacing:1.2,
                        fontWeight:FontWeight.w500,
                        fontSize:18,
                      )
                  ),
                  Text(
                      "view application's manual",
                      style:TextStyle(
                        color:Colors.black45,
                        letterSpacing:1.2,
                        fontWeight:FontWeight.w500,
                        fontSize:15,
                      )
                  )
                ],
              ),
              )

            ],
          ),
        ),
        appBar:AppBar(
            title:const Text(
                'Farmdrive',
                style:TextStyle(
                    color: Colors.white,
                    fontSize:35,
                    fontWeight: FontWeight.bold
                )
            ),
            actions:[
              IconButton(
                onPressed:(){},
                icon:const  Icon(Icons.notification_important,size:26),
              ),
              const SizedBox(width: 4),
              const CircleAvatar(
                radius: 18,
              ),
              Builder(
                builder: (context) {
                  return IconButton(
                      icon :const Icon( Icons.more_vert) ,
                      onPressed:(){
                            Scaffold.of(context).openEndDrawer();
                      });
                }
              )
            ]     ),
      body:ListView(
        children:const[
          FarmerCategory(),
          FarmersCaouresel()
        ]
      )
    );
  }
}
