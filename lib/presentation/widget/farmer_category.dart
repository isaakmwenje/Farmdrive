import 'package:flutter/material.dart';

class FarmerCategory extends StatefulWidget {
  const FarmerCategory({Key? key}) : super(key: key);

  @override
  _FarmerCategoryState createState() => _FarmerCategoryState();
}

class _FarmerCategoryState extends State<FarmerCategory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0,left:12.0 ),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          const Padding(
            padding:  EdgeInsets.all(8.0),
            child:  Text(
              'categories',
              style:TextStyle(
                 fontSize:20,
                 color:Colors.black54,
                 fontWeight:FontWeight.w500,
              )
            ),
          ),
          Row(

            children: [
              Container(
                height:150,
                width:150,
                decoration:BoxDecoration(
                  color:Colors.red,
                  borderRadius:BorderRadius.circular(10),
                ),
                child:Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children:const[
                    Text(
                      'FRUIT',
                      style:TextStyle(
                        color:Colors.white,
                        fontSize:18,
                        fontWeight:FontWeight.w500,
                      )
                    ),
                    Text(
                      'FARMERS',
                      style:TextStyle(
                        color:Colors.white,
                        fontSize:18,
                        fontWeight:FontWeight.w500,
                      )
                    )
                  ]
                )
              ),
              const SizedBox(width:30),
              Container(
                  height:150,
                  width:150,
                  decoration:BoxDecoration(
                    color:Colors.green,
                    borderRadius:BorderRadius.circular(10),
                  ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children:const[
                        Text(
                            'VEGETABLE',
                            style:TextStyle(
                              color:Colors.white,
                              fontSize:18,
                              fontWeight:FontWeight.w500,
                            )
                        ),
                        Text(
                            'FARMERS',
                            style:TextStyle(
                              color:Colors.white,
                              fontSize:18,
                              fontWeight:FontWeight.w500,
                            )
                        )
                      ]
                  )
              ),
            ],
          ),
          const SizedBox(height:10),
          Row(
            children: [
              Container(
                  height:150,
                  width:150,
                  decoration:BoxDecoration(
                    color:Colors.yellow,
                    borderRadius:BorderRadius.circular(10),
                  ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children:const[
                        Text(
                            'CEREAL',
                            style:TextStyle(
                              color:Colors.white,
                              fontSize:18,
                              fontWeight:FontWeight.w500,
                            )
                        ),
                        Text(
                            'FARMERS',
                            style:TextStyle(
                              color:Colors.white,
                              fontSize:18,
                              fontWeight:FontWeight.w500,
                            )
                        )
                      ]
                  )
              ),
              const SizedBox(width:30),
              Container(
                  height:150,
                  width:150,
                  decoration:BoxDecoration(
                    color:Colors.purple,
                    borderRadius:BorderRadius.circular(10),
                  ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children:const[
                        Text(
                            'OTHERS',
                            style:TextStyle(
                              color:Colors.white,
                              fontSize:18,
                              fontWeight:FontWeight.w500,
                            )
                        ),
                      ]
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }
}
