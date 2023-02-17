import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:Farmdrive/controller/cart_controller.dart';
import 'package:Farmdrive/controller/farmer_controller.dart';
import 'package:Farmdrive/controller/product_controller.dart';
import 'package:Farmdrive/data/cereal_data.dart';
import 'package:Farmdrive/data/crop_data.dart';
import 'package:Farmdrive/presentation/pages/home/select_farmer.dart';
import 'package:Farmdrive/presentation/screen/nav_screen.dart';
import 'package:Farmdrive/presentation/widget/reusable_widget/big_text.dart';
import 'package:Farmdrive/presentation/widget/reusable_widget/expandable_widget.dart';
import 'package:Farmdrive/presentation/widget/reusable_widget/small_text.dart';
import 'package:Farmdrive/presentation/widget/vegetable_page_widget/vegetable_farmers_search_couresel.dart';
import '../../controller/crop_pricing_controller.dart';
import '../../controller/product_class_controller.dart';
import '../../data/data123.dart';
import '../../data/model/crop_pricing.dart';
import '../../data/product_model.dart';
import '../../utilities/AppConstants.dart';
import '../../utilities/color_constants.dart';
import '../../utilities/dimensions.dart';
import '../widget/reusable_widget/expandable_widget_paragraphs.dart';
import '../screen/cart_page.dart';

class CerealPage extends StatefulWidget {
  ProductModel crop;
  CerealPage({Key? key,required this.crop}) : super(key: key);

  @override
  State<CerealPage> createState() => _CerealPageState();
}

class _CerealPageState extends State<CerealPage> {
  String? selectedSize;
  String? selectedClass;
  List<String>? cerealsList;

  void initState() {
    // TODO: implement initState
    super.initState();

    if(Get.find<CropPricingController>().selectedCropPricing.containsKey(widget.crop.id)){
      final cropPricing = Get.find<CropPricingController>().getPricing(widget.crop);

      if(cropPricing?.size != null){
        selectedSize = cropPricing!.size;
      }
      if(cropPricing?.categoryId != null){
        selectedClass  = Get.find<ProductClassController>().findClassName(cropPricing!.categoryId!);
        // print(selectedClassification.toString()+'classification');
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    if(widget.crop.kind == 'rice' ||widget.crop.kind == 'peanut' ||widget.crop.kind == 'banana'){
      cerealsList = cereals3[widget.crop.kind];
    }else{
      cerealsList = ['purnami','shonami','kwavadis'];
    }
    cerealsList =  Get.find<ProductClassController>().getCropClassification(id:widget.crop.id!).isEmpty?['nill']:Get.find<ProductClassController>().getCropClassification(id:widget.crop.id!);
    var product = Get.find<ProductController>();
    product.initProduct(Get.find<CartController>(),widget.crop);
    return Scaffold(
      backgroundColor:Colors.white,
      body:CustomScrollView(
        slivers:[
          SliverAppBar(
            backgroundColor:Colors.white,
            pinned:true,
            expandedHeight:Dimensions.height100*2,
            flexibleSpace:FlexibleSpaceBar(
              background:Image(
                image:NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOADS+widget.crop.thumbnail!),
                width:double.maxFinite,
                fit:BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  print('error'+error.toString());
                  return Container(
                    height:Dimensions.height10*14,
                    width:Dimensions.width10*16,
                    color: Colors.grey.shade200,
                  );
                },
              ),
            ),
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
                        decoration:  BoxDecoration(
                          color:AppColors.mainColor,
                          shape:BoxShape.circle,
                        ),
                        child:const  Icon(Icons.shopping_cart,color:Colors.white)),
                    Positioned(
                      top:0,
                      left:Dimensions.width10*3-Dimensions.width4/2,
                      child:  GetBuilder<ProductController>(
                          builder: (product) {
                            return Get.find<ProductController>().getQuantity(widget.crop)>=1?SmallText(text: product.inCartItem.toString(),color:Colors.white):SizedBox.shrink();
                          }
                      ),
                    ),

                  ],
                ),
              ),
             SizedBox(width:Dimensions.width6),
            ],
            leading:InkWell(
                onTap:(){
                  Get.to(()=>NavBar());
                },
                child: Icon(Icons.arrow_back_ios,color:Colors.black)),
            bottom:PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.height10*2),
              child:Container(
                alignment: Alignment.center,
                width:double.infinity,
                decoration:const BoxDecoration(
                  color:Colors.white,
                  borderRadius:BorderRadius.only(
                    topLeft:Radius.circular(16),
                    topRight:Radius.circular(16),
                  )
                ),
                  child: BigText(text:widget.crop.kind!)),
            ),
          ),
         SliverToBoxAdapter(
           child:Padding(
               padding:EdgeInsets.only(left:Dimensions.width10*2,right:Dimensions.width10*2,top:Dimensions.height10),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children:[
                 Row(
                   mainAxisAlignment:MainAxisAlignment.spaceBetween,
                   crossAxisAlignment:CrossAxisAlignment.center,
                   children: [
                     Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
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
                           SizedBox(height:Dimensions.height10),
                           SmallText(text:'Picked ',color:Colors.black38,size:20)
                         ]
                     ),
                     Row(children:[
                       GestureDetector(
                         onTap:(){
                           product.setQuantity(false);
                         },
                         child: Container(
                           width:Dimensions.height10*4,
                           height:Dimensions.height10*4,
                           decoration: BoxDecoration(
                             shape:BoxShape.circle,
                             color:AppColors.mainColor,
                           ),
                           child:Center(
                             child: Column(
                               children:const[
                                 Icon(Icons.minimize,color:Colors.white),
                               ],
                             ),
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
                           width:Dimensions.height10*4,
                           height:Dimensions.height10*4,
                           decoration: BoxDecoration(
                             shape:BoxShape.circle,
                             color:AppColors.mainColor,
                           ),
                           child:Column(
                             children:[
                               SizedBox(height:Dimensions.height6),
                               Icon(Icons.add,color:Colors.white),
                             ],
                           ),
                         ),
                       ),
                     ]),
                   ],
                 ),
                 SizedBox(height:Dimensions.height4*4),
                 BigText(text:'classification',size:18),
                 SizedBox(height:Dimensions.height10),
                 ExpandedParagraph(text:widget.crop.benefitsDescription!),                 const SizedBox(height: 16),
                 BigText(text:'size',size:18),
                  SizedBox(height:Dimensions.height10),
                 ExpandedParagraph(text:"Cereals have relatively no sizes defined as they resemble grains"),                 const SizedBox(height: 16),
                 Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children:[
                       Container(
                         padding:EdgeInsets.symmetric(horizontal:Dimensions.width4*2,vertical:Dimensions.height4*2),
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
                             items: <String>['nill']
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
                             value: selectedClass,
                             onChanged: (String? newValue) {
                               setState(() {
                                 selectedClass = newValue;
                               });
                             },
                             items: cerealsList!
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
         )
        ]
      ),
      bottomNavigationBar:Container(
        margin:EdgeInsets.symmetric(horizontal:Dimensions.width10*2,vertical:Dimensions.height10),
        child: GetBuilder<FarmerController>(
            builder: (farmerController) {
              final farmer = farmerController.getFarmer(widget.crop);
              final cropPricing = Get.find<CropPricingController>().getPricing(widget.crop);
              return GestureDetector(
                onTap:(){
                  if(selectedSize == null) selectedSize = 'nill';
                  if(selectedClass == null) selectedClass = 'Cal';
                  product.addItem(size:selectedSize!,classification:selectedClass!,cropPricing:cropPricing,farmerModel:farmer,crop:widget.crop);
                },
                child: Container(
                    height: Dimensions.height10*6,
                    width:Dimensions.width100*2+Dimensions.height10,
                    decoration:BoxDecoration(
                      color:AppColors.mainColor,
                      borderRadius:BorderRadius.circular(8),
                    ),
                    child:Row(
                        children:[
                          GestureDetector(
                            onTap:(){
                              FocusScope.of(context).unfocus();
                              if (selectedClass == null) {
                                Get.snackbar('select ',
                                    'Select crop size and classification to proceed',
                                  backgroundColor: const Color(0xFFE3F2FD),
                                );
                              } else {
                                Get.to(() => SelectFarmer(
                                    crop: widget.crop,
                                    categoryId: Get.find<ProductClassController>()
                                        .findClassId(selectedClass!),
                                    size: 'nill'));
                              }                            },
                            child: Container(
                              padding:EdgeInsets.symmetric(horizontal:8.0),
                              margin: EdgeInsets.all(4.0),
                              alignment: Alignment.center,
                              height:60,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0)
                                ),
                                border:Border.all(
                                  color:Colors.black12,
                                ),
                                color:Colors.white,
                              ),
                              child: BigText(text:'Select farmer',size:18),
                            ),
                          ),
                          SizedBox(width:Dimensions.width10*2),
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
