import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled3/data/farmer_data.dart';

class FarmersCaouresel extends StatefulWidget {
  const FarmersCaouresel({Key? key}) : super(key: key);

  @override
  _FarmersCaoureselState createState() => _FarmersCaoureselState();
}

class _FarmersCaoureselState extends State<FarmersCaouresel> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Padding(
          padding: const EdgeInsets.only(left:20,top:8.0,bottom:8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('see nearby farmers',
              style:TextStyle(
                fontSize:20,
                fontWeight:FontWeight.w500,
                color:Colors.black54,
              )),
              Icon(
                Icons.arrow_forward_ios,
                size:20.0,
              )
            ],
          ),
        ),
        SizedBox(
          height:205,
          child:ListView.builder(
            scrollDirection:Axis.horizontal,
            itemCount:5,
            itemBuilder:(context,index){
              Farmer farmer = farmers[index];
              return Container(
                height:140,
                width:340,
                margin:const EdgeInsets.only(left:15),
                decoration:BoxDecoration(
                  color:Colors.white,
                  boxShadow:const [
                    BoxShadow(
                      color:Colors.black12,
                      offset:Offset(1,1),
                      blurRadius:1,
                    ),
                    BoxShadow(
                      color:Colors.black12,
                      offset:Offset(-1,-1),
                      blurRadius:1,
                    )
                  ],
                  borderRadius:BorderRadius.circular(20),
                  border:Border.all(
                    color: const Color(0xFFF3F5F7),
                    width: 2.0,
                  )
                ),
                  child:Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:8.0,top:8.0),
                        child: Row(
                          children:[
                            const CircleAvatar(
                              radius:24,
                            ),
                            const SizedBox(width:20),
                            Text(
                              farmer.name,
                              style:const TextStyle(
                                fontWeight:FontWeight.w500,
                                fontSize:20,
                                letterSpacing:1.0,
                              )
                            ),
                            const SizedBox(width:20),
                            Icon(
                              Icons.location_on,
                              color:Colors.lightBlueAccent[700],
                            ),
                            Expanded(
                              child: Text(
                                farmer.location,
                                  style: const TextStyle(
                                  fontSize:18,
                                  color:Colors.black87,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing:1.3,
                              ),
                                maxLines:1,
                                overflow:TextOverflow.ellipsis,
                              ),
                            )
                          ]
                        ),
                      ),
                     Padding(
                       padding: const EdgeInsets.only(left:12),
                       child: Text(
                         farmer.info,
                        style:const TextStyle(
                          letterSpacing:1.5,
                          fontSize:17,
                        ),
                       maxLines:1,
                       ),
                     ),
                      const Divider(
                          color:Colors.black12,
                          thickness:1),
                      Padding(
                        padding: const EdgeInsets.only(left:12),
                        child: Row(
                          children: [
                            const Text(
                              'product',
                              style:TextStyle(
                                fontSize:20,
                                fontWeight:FontWeight.w500,
                                letterSpacing:1.1,
                              )
                            ),
                            const SizedBox(width:16.0),
                            Container(
                              padding:const EdgeInsets.all(4.0),
                              alignment:Alignment.center,
                              decoration:BoxDecoration(
                                borderRadius:BorderRadius.circular(10),
                                border:Border.all(
                                  color:Colors.purple,
                                ),
                            ),
                              child: Text(
                                farmer.crop,
                                style:const TextStyle(
                                  fontSize:18,
                                )
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height:6.0),
                      Padding(
                        padding: const EdgeInsets.only(left:12.0),
                        child: Row(
                          children: [
                            const Text(
                                'rating',
                                style:TextStyle(
                                  fontSize:20,
                                  fontWeight:FontWeight.w500,
                                  letterSpacing:1.1,
                                )
                            ),
                            const SizedBox(width:30.0),
                            Row(
                              children: [
                                RatingBar.builder(
                                  ignoreGestures:true,
                                  initialRating:farmer.rating,
                                  onRatingUpdate: (rating){},
                                  itemSize:20,
                                  itemBuilder:(context,_){
                                    return const Icon(Icons.star,color:Colors.amber);
                                  }
                                ),
                                const SizedBox(width:6),
                                Text(
                                  '${farmer.rating}',
                                  style:const TextStyle(
                                    fontSize:18,
                                    fontWeight:FontWeight.w400,
              )
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height:16),
                      Row(
                          children:const [
                            Icon(
                              Icons.call,
                              color:Colors.green,
                              size:16,
                            ),
                            SizedBox(width:10),
                            Text(
                              'call',
                              style:TextStyle(
                                fontSize:16,
                                letterSpacing:1.2,
                              )
                            ),
                            SizedBox(width:30),
                            Icon(
                              Icons.message,
                              color:Colors.purple,
                              size:16,
                            ),
                            SizedBox(width:10.0),
                            Text(
                                'message',
                                style:TextStyle(
                                  fontSize:16,
                                  letterSpacing:1.2,
                                )
                            ),
                            SizedBox(width:25),
                            Icon(
                              Icons.bookmark_add,
                              color:Colors.yellow,
                              size:16,
                            ),
                            SizedBox(width:10),
                            Text(
                                'save',
                                style:TextStyle(
                                  fontSize:16,
                                  letterSpacing:1.2,
                                )
                            ),
                          ]
                      )
                    ],
              )
              );
            }
          )
        )
      ]
    );
  }
}
