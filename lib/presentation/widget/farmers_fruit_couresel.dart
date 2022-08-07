import 'package:flutter/material.dart';
import 'package:untitled3/data/farmer_data.dart';

class FruitFarmerCaoresel extends StatefulWidget {
  const FruitFarmerCaoresel({Key? key}) : super(key: key);

  @override
  _FruitFarmerCaoreselState createState() => _FruitFarmerCaoreselState();
}

class _FruitFarmerCaoreselState extends State<FruitFarmerCaoresel> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children:[
          Padding(
            padding: const EdgeInsets.only(left:30.0,top:16.0,bottom:8.0,right:8.0),
            child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children:const[
                  Text(
                      'fruit farmers',
                      style: TextStyle(
                        letterSpacing:1.5,
                        fontSize:18,
                      )
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size:20,
                  )
                ]
            ),
          ),
          SizedBox(
              height:150,
              child:ListView.builder(
                  scrollDirection:Axis.horizontal,
                  itemCount:5,
                  itemBuilder:(context,index){
                    Farmer farmer = farmers[index];
                    return Container(
                        margin:const EdgeInsets.only(left:6.0),
                        height:170,
                        width:160,
                        decoration:BoxDecoration(
                            borderRadius:BorderRadius.circular(20),
                            boxShadow:const [
                              BoxShadow(
                                color:Colors.black12,
                              ),
                            ]
                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      radius:20,
                                    ),
                                    const SizedBox(width: 15),
                                    const Icon(
                                      Icons.location_on,
                                    ),
                                    Flexible(
                                      child: Text(
                                        farmer.location,
                                        overflow:TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height:5),
                                Text(
                                    farmer.name,
                                    style:const TextStyle(
                                      fontSize:16,
                                    )
                                ),
                                const SizedBox(height: 10),
                                Container(
                                    padding:const EdgeInsets.all(6.0),
                                    decoration:BoxDecoration(
                                      color:Colors.black.withOpacity(0.7),
                                      borderRadius:BorderRadius.circular(14),
                                    ),
                                    child:Row(
                                        mainAxisSize:MainAxisSize.min,
                                        children:[
                                          Text(
                                              farmer.crop,
                                              style:const TextStyle(
                                                color:Colors.white,
                                              )
                                          ),
                                          const SizedBox(width:6),
                                          const Icon(
                                            Icons.photo,
                                            color:Colors.white,
                                          )
                                        ]

                                    )
                                ),
                              ]
                          ),
                        )
                    );
                  }
              )
          )
        ]
    );
  }
}
