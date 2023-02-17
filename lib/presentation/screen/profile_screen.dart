import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:Farmdrive/controller/auth_controllers.dart';
import 'package:Farmdrive/controller/order_controller.dart';
import 'package:Farmdrive/presentation/pages/profile/user_info.dart';
import 'package:Farmdrive/presentation/pages/profile/farmer_info.dart';

import '../../controller/cart_controller.dart';
import '../../controller/connectivity.dart';
import '../../controller/crop_pricing_controller.dart';
import '../../controller/farmer_controller.dart';
import '../../controller/image_controller.dart';
import '../../controller/user_controller.dart';
import '../../utilities/AppConstants.dart';
import '../../utilities/color_constants.dart';
import '../../utilities/dimensions.dart';
import '../pages/view_address.dart';
import '../pages/profile/edit_farmer_info.dart';

import '../pages/sign_in_page.dart';
import '../widget/profile/account_widget.dart';
import '../widget/reusable_widget/big_text.dart';

import 'package:get/get.dart';

import '../widget/reusable_widget/small_text.dart';
import '../widget/sign_in/custom_loader.dart';
import '../widget/sign_in/sign_up_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map _source = {ConnectivityResult.none: false};

  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;

  String string = '';

  bool? isOnline ;

  void initState() {
     isOnline = true;
    _networkConnectivity.initialise();
    _networkConnectivity.myStream.listen((source) {
      _source = source;
      print('source $_source');
      // 1.
      switch (_source.keys.toList()[0]) {
        case ConnectivityResult.mobile:
          string = _source.values.toList()[0] ? 'Online' : 'You\'re offline';
          if (_source.values.toList()[0]) isOnline = true;
          break;
        case ConnectivityResult.wifi:
          string = _source.values.toList()[0] ? 'Online' : 'You\'re offline';
          if (_source.values.toList()[0]) isOnline = true;
          break;
        case ConnectivityResult.none:
        default:
          string = 'You\'re offline';
          isOnline= false;
      }
      // 2.
      setState(() {});
      // 3
    });
    super.initState();
  }

  @override
  void dispose() {
    _networkConnectivity.disposeStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = Get.find<AuthController>().userLoggedIn();

    if (isLoggedIn) {
      print('isFarmer' + Get.find<AuthController>().getUser().toString());
      !Get.find<AuthController>().getUser()
          ? Get.find<UserController>().getUserInfo()
          : Get.find<UserController>().getFarmerInfo();
    }
    return Scaffold(
      backgroundColor: isOnline! ? Colors.white24 : Colors.white,
      body: SafeArea(
        child: isOnline!
            ? GetBuilder<UserController>(builder: (userController) {
                return isLoggedIn
                    ? (userController.profileLoading
                        ? SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(children: [
                              SizedBox(height: Dimensions.height6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: Dimensions.width6),
                                  isLoggedIn
                                      ? BigText(
                                          text: Get.find<AuthController>()
                                                  .getUser()
                                              ? 'Farmer'
                                              : 'User',
                                          color: Colors.black,
                                        )
                                      : SizedBox.shrink(),
                                  const SizedBox(width: 10),
                                  BigText(
                                    text: isLoggedIn ? 'profile' : '',
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              SizedBox(height: Dimensions.height10 * 2),
                              GetBuilder<ImageController>(
                                  builder: (imageController) {
                                return Center(
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        // width:120,
                                        child: Stack(
                                          children: [
                                            CircleAvatar(
                                              radius: Dimensions.width10 * 6,
                                              backgroundColor: Colors.grey[300],
                                              backgroundImage: imageController
                                                          .imagePath !=
                                                      null
                                                  ? NetworkImage(
                                                      AppConstants.BASE_URL +
                                                          imageController
                                                              .imagePath!,
                                                    )
                                                  : null,
                                            ),
                                            imageController.isLoading
                                                ? Positioned(
                                                    top: Dimensions.width10 * 4,
                                                    left:
                                                        Dimensions.width10 * 4,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          AppColors.mainColor,
                                                    ))
                                                : SizedBox.shrink(),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: GestureDetector(
                                            onTap: () {
                                              imageController.pickImage();
                                            },
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  AppColors.mainColor,
                                              child: Icon(
                                                Icons.camera_alt_rounded,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                );
                              }),
                              SizedBox(height: Dimensions.height10 * 2),
                              AccountWidget(
                                  icon: Icons.person,
                                  text: userController.userModel?.name ?? '',
                                  backgroundColor: Colors.grey[300]!),
                              AccountWidget(
                                  icon: Icons.phone,
                                  backgroundColor: Colors.grey[300]!,
                                  text:
                                      userController.userModel?.phoneNo ?? ''),
                              AccountWidget(
                                  icon: Icons.email,
                                  text: userController.userModel?.email ?? '',
                                  backgroundColor: Colors.grey[300]!),
                              GestureDetector(
                                  onTap: () {
                                    if (Get.find<AuthController>()
                                        .userLoggedIn()) {
                                      Get.find<AuthController>()
                                          .clearSharedData();
                                      Get.find<CartController>().clearCart();
                                      Get.find<OrderController>().clearOrders();
                                      Get.find<OrderController>().clear();
                                      Get.find<ImageController>()
                                          .clearSharedData();
                                      Get.find<UserController>()
                                          .clearSharedData();
                                      Get.find<FarmerController>()
                                          .clearFarmerList();
                                      Get.find<CropPricingController>()
                                          .remove();
                                      isOnline = true;
                                      Get.off(() => SignIn());
                                    }
                                  },
                                  child: AccountWidget(
                                    icon: Icons.logout,
                                    text: 'log out',
                                    backgroundColor: Colors.grey[300]!,
                                  )),
                            ]))
                        : CustomLoader())
                    : Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(6.0),
                                  height: Dimensions.height100 +
                                      Dimensions.height10 * 14,
                                  width: Dimensions.width100 * 2 +
                                      Dimensions.width40,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                    color: AppColors.mainColor!,
                                    width: 1.0,
                                  )),
                                  child: Image(
                                    height: Dimensions.height100 +
                                        Dimensions.height10 * 5,
                                    width: Dimensions.width100 * 2 +
                                        Dimensions.width40,
                                    image: AssetImage('assets/groceries3.jpg'),
                                    fit: BoxFit.cover,
                                  )),
                              SizedBox(height: Dimensions.height10),
                              GestureDetector(
                                onTap: () {
                                  Get.off(() => SignIn());
                                },
                                child: Container(
                                    color: AppColors.mainColor!,
                                    width: Dimensions.width100 * 2 +
                                        Dimensions.width40,
                                    height: Dimensions.height10 * 3,
                                    child: Center(
                                      child: BigText(
                                          text: 'Log in',
                                          color: Colors.white,
                                          size: 18),
                                    )),
                              ),
                              SizedBox(height: Dimensions.height100)
                            ]),
                      );
              })
            : Center(
                child: Image.asset(
                  "assets/no_internet.gif",
                ),
              ),
      ),
      floatingActionButton: isOnline!?(Get.find<AuthController>().userLoggedIn()
          ? GetBuilder<UserController>(builder: (userController) {
        return FloatingActionButton(
          backgroundColor: AppColors.mainColor,
          onPressed: () {
            Get.find<AuthController>().getUser()
                ? Get.to(() => FarmerInfo())
                : Get.to(() => const UserInfo());
          },
          child: const Icon(Icons.edit, color: Colors.white),
        );
      })
          : null):SizedBox.shrink()
    );
  }
}
