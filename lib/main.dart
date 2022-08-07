import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/presentation/screen/nav_screen.dart';
import 'controller/farmer_controller.dart';
import ' repository/cart_repository.dart';
import 'constants/route_helper.dart';
import 'controller/cart_controller.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<FarmerController>().getFarmerData;
    Get.find<CartController>().getCartData;
    Get.find<CartRepo>().getCartHistoryList();
            return GetBuilder<CartController>(
              builder: (context) {
                return GetMaterialApp(
                    debugShowCheckedModeBanner: false,
                    home:  const NavScreen(),
                      theme: ThemeData(
                        scaffoldBackgroundColor: const Color(0xFFE3F2FD),
                      ),
                  initialRoute:RouteHelper.getSplashScreen(),
                  getPages: RouteHelper.pages,
                    );
              }
            );

  }
}

