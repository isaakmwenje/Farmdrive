import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/data/vegetable_data.dart';
import 'package:untitled3/presentation/pages/vegetables_page.dart';

class VegetableCouresel extends StatefulWidget {
  const VegetableCouresel({Key? key}) : super(key: key);

  @override
  _VegetableCoureselState createState() => _VegetableCoureselState();
}

class _VegetableCoureselState extends State<VegetableCouresel> {
  PageController pageController = PageController(viewportFraction:0.475);
  var currPageValue = 2.0;
  var scaleFactor = 0.9;
  var height = 200;

  @override
  void initState(){
    super.initState();
    pageController.addListener((){
      setState((){
        currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:8.0,bottom:8.0,left:30,right: 8.0),
              child: Row(
                  mainAxisAlignment : MainAxisAlignment.spaceBetween,
                  children: const [
                  Text(
                  'vegetables',
                  style:TextStyle(
                    fontSize:20,
                    fontWeight:FontWeight.w500,
                    color:Colors.black54,
                    letterSpacing:1.5,
                  )
                        ),
                   Icon(
                    Icons.arrow_forward_ios,
                    color:Colors.black,
                    size:20,
                  ),
               ],
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection:Axis.horizontal,
                itemCount:vegetables.length,
                itemBuilder:(context,index){
                  Matrix4 matrix = Matrix4.identity();
                  if(index == currPageValue.floor()){
                    var currScale = 1-(currPageValue-index)*(1-scaleFactor);
                    print(currScale);
                    var currTrans = height*(1-currScale)/2;
                    matrix = Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0,currTrans,0);
                  }else if(index == currPageValue.floor()+1){
                    var currScale = scaleFactor+(currPageValue-index+1)*(1-scaleFactor);
                    var currTrans = height*(1-currScale)/2;
                    matrix = Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0,currTrans,0);
                  }else if (index == currPageValue.floor()-1){
                    var currScale = 1-(currPageValue-index)*(1-scaleFactor);
                    var currTrans = height*(1-currScale)/2;
                     matrix = Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0,currTrans,0);
                  }
                  Vegetable vegetable = vegetables[index];
                  return GestureDetector(
                    onTap:(){
                      Get.to(()=>VegetablesPage(crop: vegetable,));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      width:170,
                      height:100,
                      decoration: BoxDecoration(
                        boxShadow:const [
                          BoxShadow(
                            color:Colors.black12,
                            blurRadius:5,
                            offset:Offset(1,1),
                          ),
                          BoxShadow(
                              color:Colors.black12,
                              blurRadius:1,
                              offset:Offset(-1,-1)
                          ),
                        ],
                          borderRadius:BorderRadius.circular(20),
                          color:Colors.white,
                        ),
                      child:Column(
                        children:[
                          ClipRRect(
                            borderRadius:const BorderRadius.only(
                              topLeft:Radius.circular(20),
                              topRight:Radius.circular(20),
                            ),
                            child: Image(
                              image: AssetImage(
                               vegetable.image,
                              ),
                              height:110,
                              width:170,
                              fit:BoxFit.cover,
                            )
                          ),
                          const Divider(
                            color:Colors.black12,
                            thickness:1.1,
                            indent: 30,
                            endIndent: 30,
                          ),
                          Text(
                            vegetable.type,
                            style:const TextStyle(
                              fontWeight:FontWeight.w400,
                              fontSize:18,
                            ),
                          ),
                          Text(
                            'KES'+vegetable.price.toString()+'/kg',
                            style: const TextStyle(
                              fontWeight:FontWeight.bold,
                              fontSize:20,
                            ),
                          ),
                        ]
                      )

                    ),
                  );
                }
              )
           )
          ],
        ),
      ],
    );
  }
}