import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:untitled3/controller/product_controller.dart';
import 'package:untitled3/data/cereal_data.dart';
import 'package:untitled3/data/fruit_data.dart';
import 'package:untitled3/presentation/pages/cereal_page.dart';

class CerealCouresel extends StatefulWidget {
  const CerealCouresel({Key? key}) : super(key: key);

  @override
  _CerealCoureselState createState() => _CerealCoureselState();
}

class _CerealCoureselState extends State<CerealCouresel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 30,top:16.0,right: 8.0,bottom:8.0,
          ),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children:const [
              Text(
                'cereals',
                style:TextStyle(
                  letterSpacing:1.5,
                  fontSize:20,
                  color:Colors.black54,
                  fontWeight:FontWeight.w500,
                )
              ),
              Icon(
                Icons.arrow_forward_ios,
                size:20,
              )
            ]
          ),
        ),
        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:cereals.length,
            itemBuilder:(context,index){
              Cereal cereal = cereals[index];
              return GestureDetector(
                onTap:(){
                 Get.to(() => CerealPage(crop:cereal));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 6.0),
                  child: Container(
                    margin: const EdgeInsets.only(left:20),
                      height:210,
                    width:150,
                    decoration:BoxDecoration(
                      boxShadow:const[
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
                      color:Colors.white,
                      borderRadius:BorderRadius.circular(20),
                    ),
                  child:Column(
                    children: [
                      Container(
                       decoration:const BoxDecoration(
                       border:Border(
                         bottom:BorderSide(
                           color:Colors.black12,
                           width:2.0,
                         )
                       ),
                  ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                        topLeft:Radius.circular(20),
                         topRight: Radius.circular(20),
                  ),
                          child: Image(
                            width:150,
                            height: 180,
                            image: AssetImage(cereal.image),
                            fit:BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        cereal.type,
                        style:const TextStyle(
                          fontSize:18,
                        ),
                      ),
                      Text(
                        'KES'+cereal.price.toString()+'/kg',
                        style: const TextStyle(
                          fontSize:20,
                          fontWeight:FontWeight.bold,
                        )
                      )
                    ],
                  )),
                ),
              );
            }
          )
        )
      ]
    );
  }
}

