import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:Farmdrive/controller/cart_controller.dart';
import 'package:Farmdrive/controller/farmer_controller.dart';
import 'package:Farmdrive/controller/product_controller.dart';
import 'package:Farmdrive/presentation/pages/home/select_farmer.dart';
import 'package:Farmdrive/presentation/widget/reusable_widget/big_text.dart';
import 'package:Farmdrive/presentation/widget/reusable_widget/small_text.dart';
import 'package:Farmdrive/presentation/widget/vegetable_page_widget/vegetable_farmers_search_couresel.dart';

import '../../controller/crop_pricing_controller.dart';
import '../../controller/fruits_controller.dart';
import '../../controller/product_class_controller.dart';
import '../../data/FruitInfo.dart';
import '../../data/data123.dart';
import '../../data/product_model.dart';
import '../../utilities/AppConstants.dart';
import '../../utilities/color_constants.dart';
import '../../utilities/dimensions.dart';
import '../screen/nav_screen.dart';
import '../widget/reusable_widget/expandable_widget_paragraphs.dart';
import '../screen/cart_page.dart';

class FruitPage extends StatefulWidget {
  ProductModel crop;

  FruitPage({Key? key, required this.crop}) : super(key: key);

  @override
  State<FruitPage> createState() => _FruitPageState();
}

class _FruitPageState extends State<FruitPage> {
  GlobalKey selectColorKey = GlobalKey();
  Color selectedSpectrumColor = Colors.white;
  String? selectedSize;
  List<String>? fruitsList;

  String? selectedClass;

  @override
  Widget build(BuildContext context) {
    if (widget.crop.kind == 'apple' ||
        widget.crop.kind == 'avocado' ||
        widget.crop.kind == 'banana') {
      fruitsList = fruits2[widget.crop.kind];
    } else {
      fruitsList = ['nocap', 'ybnb', 'trnt'];
    }
    var product = Get.find<ProductController>();
    product.initProduct(Get.find<CartController>(), widget.crop);
    var selectableColors =
        Get.find<FruitController>().getFruitColors(widget.crop.kind!);

    void _selectColor(Offset touchPosition) {
      final RenderBox? renderBox =
          selectColorKey.currentContext?.findRenderObject() as RenderBox?;
      int colorCount = selectableColors.length;
      final double blobDiameter = renderBox!.size.height;
      final double blobRadius = blobDiameter / 2;
      final separatorDistance =
          (100 - (colorCount * blobDiameter)) / (colorCount - 1);

      final double touchX = touchPosition.dx.clamp(0, renderBox.size.width);
      final double fractionalTouchX =
          (max(touchX - blobRadius, 0.0) / (blobDiameter + separatorDistance))
              .clamp(0.0, colorCount - 1);

      final int leftColorIndex = fractionalTouchX.floor();
      final int rightColorIndex = fractionalTouchX.ceil();

      final MaterialColor leftSelectedColor = selectableColors[leftColorIndex];
      final MaterialColor rightSelectedColor =
          selectableColors[rightColorIndex];

      final MaterialColor selectedColor =
          (fractionalTouchX - leftColorIndex) <= 0.5
              ? leftSelectedColor
              : rightSelectedColor;

      final Color? spectrumColor = Color.lerp(
        leftSelectedColor,
        rightSelectedColor,
        fractionalTouchX - leftColorIndex,
      );

      setState(() {
        selectedSpectrumColor = spectrumColor!;
      });
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  border: Border.all(width: 1.0, color: Colors.black12),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Image(
                      image: NetworkImage(AppConstants.BASE_URL +
                          AppConstants.UPLOADS +
                          widget.crop.thumbnail!),
                      height: Dimensions.width100 * 3,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: Dimensions.height100 * 3,
                          width: Dimensions.width10 * 16,
                          color: Colors.grey.shade200,
                        );
                      }),
                )),
          ),
          Positioned(
              right: 0,
              left: 0,
              top: 280,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width10*2, right: Dimensions.width10*2, top: Dimensions.height10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  border: Border.all(width: 1.0, color: Colors.black12),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(
                                    text: widget.crop.kind!,
                                    color: Colors.black),
                                Column(
                                  children: [
                                    SizedBox(
                                        width: Dimensions.width100 +
                                            Dimensions.width10,
                                        child: const SmallText(
                                          text: 'Picked fresh from the farm',
                                          color: Colors.black38,
                                        )),
                                  ],
                                ),
                              ]),
                          Row(children: [
                            GestureDetector(
                              onTap: () {
                                product.setQuantity(false);
                              },
                              child: Container(
                                width: 40,
                                height: 40,
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
                            SizedBox(width: Dimensions.width12),
                            GetBuilder<ProductController>(builder: (product) {
                              return BigText(
                                  text: product.inCartItems.toString());
                            }),
                            SizedBox(width: Dimensions.width12),
                            GestureDetector(
                              onTap: () {
                                product.setQuantity(true);
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.mainColor,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 8.0),
                                    Icon(Icons.add, color: Colors.white),
                                  ],
                                ),
                              ),
                            ),
                          ])
                        ],
                      ),
                      SizedBox(height: Dimensions.height4*4),
                      BigText(text: 'classification', size: 18),
                      SizedBox(height: Dimensions.height10),
                      ExpandedParagraph(
                          text: widget.crop.preparationsDescription!),
                      SizedBox(height: Dimensions.height4*4),
                      BigText(text: 'size', size: 18),
                      SizedBox(height: Dimensions.height10),
                      ExpandedParagraph(text: widget.crop.benefitsDescription!),
                      SizedBox(height: Dimensions.width4*4),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.width4*2, vertical: Dimensions.height4*2),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isDense: true,
                                  underline: null,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: Colors.black,
                                  ),
                                  hint: BigText(text: 'size', size: 18),
                                  value: selectedSize,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedSize = newValue;
                                    });
                                  },
                                  items: <String>['small', 'medium', 'large']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: BigText(text: value, size: 18),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isDense: true,
                                  underline: null,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: Colors.black,
                                  ),
                                  hint:
                                      BigText(text: 'classification', size: 18),
                                  value: selectedClass,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedClass = newValue;
                                    });
                                  },
                                  items: fruitsList!
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: BigText(text: value, size: 18),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ]),
                      SizedBox(height: Dimensions.height10),
                      // Padding(
                      //   padding: const EdgeInsets.only(left:24.0),
                      //  child: BigText(text:'introduce',size:18),
                      // ),
                      //ExpandedParagraph(text:crop.benefitsDescription!),
                    ],
                  ),
                ),
              )),
           Positioned(
            top: Dimensions.height100*2+Dimensions.height10*6,
            right: Dimensions.width10*3,
            child: Icon(Icons.favorite_border),
          ),
          Positioned(
              top: Dimensions.height10 * 6,
              left: Dimensions.width4 * 4,
              child: InkWell(
                  onTap: () {
                    Get.to(() => NavBar());
                  },
                  child: Icon(Icons.arrow_back_ios))),
          Positioned(
              top: Dimensions.height10*6,
              right: Dimensions.width10,
              child: InkWell(
                  onTap: () {
                    if (product.getQuantity(widget.crop) >= 1) {
                      Get.to(() => const CartPage());
                    }
                  },
                  child: Stack(children: [
                    Container(
                        padding: EdgeInsets.all(Dimensions.width4*3),
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.shopping_cart,
                            color: Colors.white)),
                    Positioned(
                      top: 0,
                      left: 28,
                      child: GetBuilder<ProductController>(builder: (product) {
                        return Get.find<ProductController>()
                                    .getQuantity(widget.crop) >=
                                1
                            ? SmallText(
                                color: Colors.white,
                                text: product.inCartItem.toString())
                            : const SizedBox.shrink();
                      }),
                    )
                  ])))
        ]),
        bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(horizontal: Dimensions.width10*2, vertical: Dimensions.height10),
          child: GetBuilder<FarmerController>(builder: (farmerController) {
            final farmer = farmerController.getFarmer(widget.crop);
            final cropPricing = Get.find<CropPricingController>().getPricing(widget.crop);
            return GestureDetector(
              onTap: () {
                if(selectedSize == null) selectedSize = 'nill';
                if(selectedClass == null) selectedClass = 'Cal';
                product.addItem(size:selectedSize!,classification:selectedClass!,cropPricing:cropPricing,farmerModel:farmer,crop:widget.crop);},
              child: Container(
                  height:Dimensions.height10*6,
                  width: Dimensions.width100*2 +Dimensions.width10,
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(children: [
                    GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        if (selectedSize == null || selectedClass == null) {
                          Get.snackbar('Select',
                              'Select crop size and classification to proceed',
                            backgroundColor: const Color(0xFFE3F2FD),
                          );
                        } else {
                          Get.to(() => SelectFarmer(
                              crop: widget.crop,
                              categoryId: Get.find<ProductClassController>()
                                  .findClassId(selectedClass!),
                              size: selectedSize!));
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: Dimensions.width4*2),
                        margin: EdgeInsets.all(Dimensions.width4),
                        alignment: Alignment.center,
                        height: Dimensions.height10*6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimensions.width4*2),
                            bottomLeft: Radius.circular(Dimensions.width4*2),
                            topRight: Radius.circular(Dimensions.width4*2),
                            bottomRight: Radius.circular(Dimensions.width4*2),
                          ),
                          border: Border.all(
                            color: Colors.black12,
                          ),
                          color: Colors.white,
                        ),
                        child: BigText(text: 'Select farmer', size: 18),
                      ),
                    ),
                    SizedBox(width: 10),
                    GetBuilder<CropPricingController>(
                        builder: (cropPricing) {
                          return cropPricing.selectedCropPricing.containsKey(widget.crop.id)?
                          BigText(text:cropPricing.selectedCropPricing[widget.crop.id]?.cost != null?
                          'KES'+cropPricing.selectedCropPricing[widget.crop.id]!.cost.toString():
                          'KES'+widget.crop.price.toString(),color:Colors.redAccent,size: 18)
                              :BigText(text:'KES'+widget.crop.price.toString(),color:Colors.redAccent,size:18)
                          ;
                        }
                    ),
                    BigText(
                        text: ' | Add to cart', color: Colors.white, size: 18),
                  ])),
            );
          }),
        ));
  }
}
