

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:Farmdrive/controller/cart_controller.dart';
import 'package:Farmdrive/controller/farmer_controller.dart';
import 'package:Farmdrive/controller/product_controller.dart';
import 'package:Farmdrive/data/crop_data.dart';
import 'package:Farmdrive/data/farmer_model.dart';
import 'package:Farmdrive/data/vegetable_data.dart';
import 'package:Farmdrive/presentation/pages/home/select_farmer.dart';
import 'package:Farmdrive/presentation/screen/home_screen.dart';
import 'package:Farmdrive/presentation/screen/nav_screen.dart';
import 'package:Farmdrive/presentation/widget/reusable_widget/big_text.dart';
import 'package:Farmdrive/presentation/widget/reusable_widget/expandable_widget.dart';
import 'package:Farmdrive/presentation/widget/reusable_widget/small_text.dart';
import 'package:Farmdrive/presentation/widget/vegetable_page_widget/vegetable_farmers_search_couresel.dart';
import '../../controller/crop_pricing_controller.dart';
import '../../controller/mpesa_controller.dart';
import '../../controller/order_controller.dart';
import '../../controller/product_class_controller.dart';
import '../../data/data123.dart';
import '../../data/product_class_models.dart';
import '../../data/product_model.dart';
import '../../utilities/AppConstants.dart';
import '../../utilities/color_constants.dart';
import '../../utilities/dimensions.dart';
import '../widget/reusable_widget/expandable_widget_paragraphs.dart';
import '../screen/cart_page.dart';
import '../widget/sign_in/show_custom_snackBar.dart';

class VegetablesPage extends StatefulWidget {
  ProductModel crop;
  VegetablesPage({Key? key,required this.crop,}) : super(key: key);

  @override
  State<VegetablesPage> createState() => _VegetablesPageState();
}

class _VegetablesPageState extends State<VegetablesPage> {
  String? selectedSize;
  String? selectedClassification;

  List<String> vegetablesList= [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(Get.find<CropPricingController>().selectedCropPricing.containsKey(widget.crop.id)){
      final cropPricing = Get.find<CropPricingController>().getPricing(widget.crop);

      if(cropPricing?.size != null){
        selectedSize =  cropPricing!.size?.toLowerCase();
      }
      if(cropPricing?.categoryId != null){
       selectedClassification = Get.find<ProductClassController>().findClassName(cropPricing!.categoryId!);
        // print(selectedClassification.toString()+'classification');
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    // if(widget.crop.kind == 'bell pepper' ||widget.crop.kind == 'brocolli' ){
    //   vegetablesList = vegetables1[widget.crop.kind];
    // }else{
    //   vegetablesList = ['reels','mini-leas','kebrores'];
    //




  vegetablesList=  Get.find<ProductClassController>().getCropClassification(id:widget.crop.id!).isEmpty?['nill']:Get.find<ProductClassController>().getCropClassification(id:widget.crop.id!);
    var product = Get.find<ProductController>();
    product.initProduct(Get.find<CartController>(),widget.crop);
    FocusScope.of(context).unfocus();
    return Scaffold(
      backgroundColor:Colors.white,
      body:GestureDetector(
        onTap:(){
          FocusScope.of(context).unfocus;
        },
        child: CustomScrollView(
          slivers:[
            SliverAppBar(
              bottom:PreferredSize(
                preferredSize:Size.fromHeight(Dimensions.height10*2),
                child: Container(
                  width:MediaQuery.of(context).size.width-Dimensions.width10*3,
                  margin: EdgeInsets.symmetric(horizontal:Dimensions.width10*3-Dimensions.width4),
                  alignment: Alignment.center,
                  decoration: const  BoxDecoration(
                    color: Colors.white,
                    borderRadius:const BorderRadius.only(
                      topRight:Radius.circular(30),
                      topLeft:Radius.circular(30),
                    ),
                    border: Border(
                      top: BorderSide(
                        color: Colors.black12,
                        width: 1.0,
                      ),
                      right: BorderSide(
                        color: Colors.black12,
                        width: 1.0,
                      ),
                      left: BorderSide(
                        color: Colors.black12,
                        width: 1.0,
                      ),
                      bottom: BorderSide(
                        color: Colors.black12,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child:BigText(text:widget.crop.kind!),
        ),
              ),
              automaticallyImplyLeading: false,
              leading:InkWell(
                  onTap:(){
                    Get.to(()=>NavBar());
                  },
                  child: Icon(Icons.arrow_back_ios,color:Colors.black)),
              actions:[
                GestureDetector(
                  onTap:(){
                    if(product.getQuantity(widget.crop) >= 1){
                      Get.to(()=>  const CartPage());
                    }
                    },
                  child: Stack(
                    children: [
                      Container(
                         padding:EdgeInsets.all(Dimensions.width12),
                          decoration: BoxDecoration(
                            color:AppColors.mainColor,
                            shape:BoxShape.circle,
                          ),
                          child:const  Icon(Icons.shopping_cart,color:Colors.white)),
                      Positioned(
                        top:0,
                        left:28,
                        child:  GetBuilder<ProductController>(
                          builder: (product) {
                            return Get.find<ProductController>().getQuantity(widget.crop)>=1?SmallText(text: product.inCartItem.toString(),
                              color:Colors.white,
                            ):SizedBox.shrink();
                          }
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(width:Dimensions.width10),
              ],
              backgroundColor: Colors.white,
              pinned:true,
              expandedHeight:Dimensions.height120*2,
              flexibleSpace:FlexibleSpaceBar(
                background:Container(
                  margin:const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius:const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                      border: Border.all(color:Colors.black12),
                  ),
                  child: ClipRRect(
                    borderRadius:const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Image(
                      image:NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOADS+widget.crop.thumbnail!),
                      width:double.maxFinite,
                      fit:BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height:Dimensions.height100*3,
                            width:Dimensions.width10*16,
                            color: Colors.grey.shade200,
                          );
                        }
                    ),
                  ),
                ),
              ) ,
            ),
            SliverToBoxAdapter(
              child:Padding(
                  padding:EdgeInsets.only(left:Dimensions.width10*2,right:Dimensions.width10*2,top:Dimensions.height10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                            children:[
                GetBuilder<CropPricingController>(
                  builder: (cropPricing) {
                    return cropPricing.selectedCropPricing.containsKey(widget.crop.id)?
                    BigText(text:cropPricing.selectedCropPricing[widget.crop.id]?.cost != null?
                    'KES'+cropPricing.selectedCropPricing[widget.crop.id]!.cost.toString():
                    'KES'+widget.crop.price.toString(),color:Colors.black)
                        :BigText(text:'KES'+widget.crop.price.toString(),color:Colors.black)
                    ;
                  }
                ),
                              Column(
                                children: [
                                  SizedBox(
                                      width:Dimensions.width100+Dimensions.width10,
                                      child:const SmallText(text:'Picked fresh from the farm',color:Colors.black38,)),
                                ],
                              ),
                            ]
                        ),
                        Row(children:[
                          GestureDetector(
                            onTap:(){
                              product.setQuantity(false);
                            },
                            child: Container(
                              width: Dimensions.height10*4,
                              height: Dimensions.height10*4,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.mainColor,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 2),
                                  Icon(Icons.minimize, color: Colors.white),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width:Dimensions.width12),
                          GetBuilder<ProductController>(
                              builder:(product) {
                                return BigText(text: product.inCartItems.toString());
                              }
                          ),
                          SizedBox(width:Dimensions.width12),
                          GestureDetector(
                            onTap:(){
                              product.setQuantity(true);
                            },
                            child: Container(
                              width: Dimensions.height10*4,
                              height: Dimensions.height10*4,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.mainColor,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: Dimensions.height16/2),
                                  Icon(Icons.add, color: Colors.white),
                                ],
                              ),
                            ),
                          ),
                        ])
                      ],
                    ),
                    SizedBox(height:Dimensions.height16),
                    BigText(text:'classification',size:18),
                     SizedBox(height: Dimensions.height10),
                    ExpandedParagraph(text:widget.crop.preparationsDescription!),
                   SizedBox(height: Dimensions.height16),
                    BigText(text:'size',size:18),
                    SizedBox(height: Dimensions.height10),
                    ExpandedParagraph(text:widget.crop.benefitsDescription!),                    const SizedBox(height: 16),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          Container(
                            padding:EdgeInsets.symmetric(horizontal:8,vertical:8),
                            decoration:BoxDecoration(
                              color:Colors.grey[300],
                              borderRadius:BorderRadius.circular(8),
                            ),
                            child: DropdownButtonHideUnderline(
                              child:DropdownButton<String>(
                                isDense:true,
                                underline:null,
                                icon:const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black,),
                                hint:BigText(text:'size',size:18),
                                value: selectedSize,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedSize = newValue;
                                  });
                                },
                                items: <String>['small', 'medium', 'large']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: BigText(text:value,size:18),
                                  );
                                })
                                    .toList(),
                              ),
                            ),
                          ),
                          Container(
                            padding:EdgeInsets.symmetric(horizontal:8,vertical:8),
                            decoration:BoxDecoration(
                              color:Colors.grey[300],
                              borderRadius:BorderRadius.circular(8),
                            ),
                            child: DropdownButtonHideUnderline(
                              child:DropdownButton<String>(
                                isDense:true,
                                underline:null,
                                icon:const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black,),
                                hint:BigText(text:'classification',size:18),
                                value: selectedClassification,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedClassification = newValue;
                                    Get.find<OrderController>().setCropClassification(selectedClass: newValue!,crop:widget.crop.kind!);
                                  });
                                },
                                items:vegetablesList!.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: BigText(text:value,size:18),
                                  );
                                })
                                    .toList(),
                              ),
                            ),
                          ),
                        ]
                    ),
                    SizedBox(height:Dimensions.height10),
                    // Padding(
                    //   padding: const EdgeInsets.only(left:24.0),
                    //  child: BigText(text:'introduce',size:18),
                    // ),
                    //ExpandedParagraph(text:crop.benefitsDescription!),
                  ],
                ),
              ),
            ),
          ]
        ),
      ),
        bottomNavigationBar:Container(
          margin:EdgeInsets.symmetric(horizontal:20,vertical:10),
          child: GetBuilder<FarmerController>(
              builder: (farmerController) {
                final farmer = farmerController.getFarmer(widget.crop);
                final cropPricing = Get.find<CropPricingController>().getPricing(widget.crop);
                return GestureDetector(
                  onTap:(){
                    product.addItem(classification:selectedClassification!,size:selectedSize!,cropPricing: cropPricing,farmerModel:farmer,crop:widget.crop);
                  },
                  child: Container(
                      height:Dimensions.height10*6,
                      width:Dimensions.width100*2+Dimensions.width10,
                      decoration:BoxDecoration(
                        color:AppColors.mainColor,
                        borderRadius:BorderRadius.circular(8),
                      ),
                      child:Row(
                          children:[
                            GestureDetector(
                              onTap:(){
                                FocusScope.of(context).unfocus();
                                if(selectedSize == null  || selectedClassification == null) {
                                  Get.snackbar(
                                      'Select ','Select crop size and classification to proceed',
                                    backgroundColor: const Color(0xFFE3F2FD),
                                  );                                }else{
                                  Get.to(() => SelectFarmer(crop: widget.crop,
                                      categoryId: Get.find<
                                          ProductClassController>()
                                          .findClassId(selectedClassification!),
                                      size: selectedSize!));
                                }
                              },
                              child: Container(
                                padding:EdgeInsets.symmetric(horizontal:8.0),
                               margin: EdgeInsets.all(4.0),
                                alignment: Alignment.center,
                                height:60,
                                decoration:BoxDecoration(
                                  borderRadius:const BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    bottomLeft:Radius.circular(8.0),
                                    topRight: Radius.circular(8.0),
                                    bottomRight:Radius.circular(8.0),
                                  ),
                                  border:Border.all(
                                    color:Colors.black12,
                                  ),
                                  color:Colors.white
                                ),
                                child: BigText(text:'Select farmer',size:18,color:Colors.black),
                              ),
                            ),
                            SizedBox(width:Dimensions.width20),
                            BigText(text:'Add to cart',color:Colors.white,size:18),
                          ]
                      )
                  ),
                );
              }
          ),
        ),
    );
  }
}