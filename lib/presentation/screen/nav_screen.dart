
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:Farmdrive/controller/popular_product_controller.dart';
import 'package:Farmdrive/presentation/screen/profile_screen.dart';

import '../../ repository/cart_repository.dart';
import '../../controller/auth_controllers.dart';
import '../../controller/bank_controller.dart';
import '../../controller/cart_controller.dart';
import '../../controller/cereals_controller.dart';
import '../../controller/crop_pricing_controller.dart';
import '../../controller/farmer_controller.dart';
import '../../controller/fruits_controller.dart';
import '../../controller/image_controller.dart';
import '../../controller/order_controller.dart';
import '../../controller/product_class_controller.dart';
import '../../controller/review_controller.dart';
import '../../controller/user_controller.dart';
import '../../utilities/color_constants.dart';
import '../pages/cart_history _page.dart';
import 'cart_page.dart';
import 'home_screen.dart';
import 'order_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      CartPage(),
      OrderScreen(),
      ProfileScreen(),
    ];
  }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: AppColors.mainColor!,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.cart),
        title: ("Cart"),
        activeColorPrimary: AppColors.mainColor!,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.call_to_action_outlined),
        title: ("My Orders"),
        activeColorPrimary: AppColors.mainColor!,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        title: ("Profile"),
        activeColorPrimary: AppColors.mainColor!,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  PersistentTabController _controller = PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    if(Get.find<AuthController>().userLoggedIn()){
      if(!Get.find<AuthController>().getUser()) {
        Get.find<UserController>().getUserInfo();
        Get.find<AuthController>().getUserId();
        Get.find<OrderController>().getDeliveredOrders();
        Get.find<ReviewController>().getReviewData;
        Get.find<ReviewController>().getReviewTextData;
      }else{
        Get.find<AuthController>().getFarmerId();
        //Get.find<FarmerController>().geCropPricing();
        Get.find<FarmerController>().getSelectedCropList();
        Get.find<BankController>().getBankList();
        Get.find<FarmerController>().getCropPricingData;
        Get.find<UserController>().getFarmerInfo();
        Get.find<OrderController>().getCustomerOrders();
        Get.find<OrderController>().getDeliveredStorageData;
      }
      Get.find<ImageController>().getProfileImage();
      Get.find<OrderController>().getOrderData;
      Get.find<OrderController>().getCancelledStorageData;
      Get.find<OrderController>().getConfirmedStorageData;
      Get.find<OrderController>().getPayedStorageData;
    }
    Get.find<ProductClassController>().getCropClasses();
    Get.find<CerealsController>().getCerealsList();
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<CerealsController>().getCerealsList();
    Get.find<FruitController>().getFruitsList();
    Get.find<FarmerController>().getCropFarmers();
    Get.find<FarmerController>().getFarmerData;
    Get.find<CropPricingController>().getCropPricingData;
    Get.find<CartController>().getCartData;
    Get.find<CartRepo>().getCartHistoryList();
    Get.find<CropPricingController>().getCropPricingList();

    return Scaffold(
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.white, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
        ));
  }
}
