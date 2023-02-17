import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:Farmdrive/controller/farmer_controller.dart';
import 'package:Farmdrive/presentation/widget/reusable_widget/big_text.dart';
import 'package:Farmdrive/presentation/widget/reusable_widget/small_text.dart';
import '../../../data/farmer_model.dart';
import '../../../data/product_model.dart';
import '../../../utilities/AppConstants.dart';
import '../../../utilities/color_constants.dart';
import '../../../utilities/dimensions.dart';
import '../../widget/select_farmer/farmer_box.dart';


class SelectFarmer extends StatefulWidget {
  ProductModel crop;
  String size;
  int? categoryId;
  SelectFarmer({Key? key,required this.crop,required this.size,required this.categoryId}) : super(key: key);

  @override
  State<SelectFarmer> createState() => _SelectFarmerState();
}

class _SelectFarmerState extends State<SelectFarmer> {
  static double _offset = 30;
  double _drawerLeft = 400;
  IconData _drawerIcon = Icons.arrow_back_ios;
  bool _init = true;
  bool showSideSheet = true;
  List farmerList = [];
  List displayList = [];
  bool isUpdated = false;
  updateList(String value){
    isUpdated = true;

      displayList = farmerList.where((element) =>
          element.name!.toLowerCase().contains(value.toLowerCase())).toList();

  }
  @override
  Widget build(BuildContext context) {
     farmerList = Get.find<FarmerController>().getFarmerList(widget.crop);

    if (_init) {
      _drawerLeft = MediaQuery.of(context).size.width - _offset;
      _init = false;
    }
    return Scaffold(
      backgroundColor:Colors.white,
      body:GestureDetector(
        onTap:(){
          FocusScope.of(context).unfocus();
          setState(() {
            isUpdated = false;
          });
        },
        child: Stack(
          children:[
            Positioned(
              left:0,
              right: 0,
              child:Container(
                alignment:Alignment.bottomCenter,
                height:Dimensions.height100,
                width:double.maxFinite,
                color:Colors.white,
                child:Row(
                  children:[
                    SizedBox(width:Dimensions.width20),
                    GestureDetector(onTap:(){
                      Navigator.of(context).pop();
                    },child: Icon(Icons.arrow_back_ios,)),
                    BigText(text:'Select farmer',color:Colors.black,size:20),
                  ]
                )
              )
            ),

            Positioned(
                left:0,
                right:0,
                top:Dimensions.height16*8,
                bottom:0,
              child:GetBuilder<FarmerController>(
                builder: (farmerController) {
                  List vegetableFarmers =  isUpdated == true?displayList:farmerList ;
                  return Column(
                      children: [
                        Row(
                            children:[
                              Container(
                                width:Dimensions.width10*19,
                                margin:EdgeInsets.only(left:Dimensions.width20),
                                padding:  EdgeInsets.all(  Dimensions.width12/2),
                                alignment: Alignment.centerLeft,
                                height: Dimensions.height10*4,
                                decoration:BoxDecoration(
                                  color:Colors.white,
                                  boxShadow:const [
                                    BoxShadow(
                                      offset:Offset(1,1),
                                      color:Colors.green,
                                      blurRadius:6,
                                    ),
                                    BoxShadow(
                                      offset:Offset(-1,-1),
                                      color:Colors.green,
                                      blurRadius:6,
                                    ),
                                  ],
                                  borderRadius:BorderRadius.circular(10.0),
                                ),
                                child: TextField(
                                  decoration:InputDecoration(
                                    prefixIcon: Icon(Icons.search,color:Colors.black,size:30),
                                    hintText: 'Search farmer',
                                    border:OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),

                                    focusedBorder:OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color:Colors.white,
                                          width:1.0,
                                        )
                                    ),
                                    enabledBorder:OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide:const BorderSide(
                                          color:Colors.white,
                                          width:1.0,
                                        )
                                    ),
                                  ),
                                  onChanged: (String value){
                                    setState(() {
                                      updateList(value);
                                    });
                                  },

                                  autofocus: false,
                                  onSubmitted: (value) {
                                    isUpdated = true;
                                  },
                                ),
                              ),
                              SizedBox(width:Dimensions.width10*5),
                              Container(
                                  padding:EdgeInsets.all(Dimensions.width4),
                                  decoration: BoxDecoration(
                                    color:Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child:Row(
                                      children: [
                                        const Icon(
                                          Icons.person,
                                        ),
                                        SmallText(text:vegetableFarmers.length.toString())
                                      ]
                                  )
                              )
                            ]
                        ),
                        Expanded(
                          child:MediaQuery.removePadding(
                            removeTop:true,
                            context: context,
                            child: ListView(
                                  padding:EdgeInsets.only(top:Dimensions.height10*2),
                                  children:vegetableFarmers.map((farmer){
                                    final checkBox = farmerController.checkFarmer(farmer);
                                    print(checkBox);
                                    return FarmersColumnWidget(
                                      size:widget.size,
                                     categoryId: widget.categoryId,
                                     checkBox:farmerController.checkFarmer(farmer),
                                      farmer: farmer,
                                      onSelectFarmer:farmerController.setFarmer, crop: widget.crop,
                                    );
                                  }).toList(),
                                )
                          )
                        )

                      ]
                  );
                }
              )
            ),



    ]
        ),
      )
    );
  }
}


class FarmersColumnWidget extends StatelessWidget {
  final FarmerModel farmer;
  final Function onSelectFarmer;
  final bool checkBox;
  final ProductModel crop;
  String size;
  int? categoryId;
   FarmersColumnWidget({Key? key,required this.crop,required this.farmer,required this.onSelectFarmer,required this.checkBox,required this.size,required this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FarmerBox(farmer: farmer,checkBox: checkBox,crop:crop, size: size,categoryId: categoryId,);
  }
}

