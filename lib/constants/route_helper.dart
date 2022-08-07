import 'package:get/get.dart';
import 'package:untitled3/presentation/screen/splash_screen.dart';

class RouteHelper {

  static const String splashScreen = '/splash-screen';

  static getSplashScreen() => '$splashScreen';

  static List<GetPage> pages = [
    GetPage(
      name:splashScreen,page:()=>const SplashScreen()
    ),
  ];

}