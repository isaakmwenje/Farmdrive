import 'package:get/get.dart';
import 'package:Farmdrive/presentation/screen/splash_screen.dart';

import '../presentation/pages/sign_in_page.dart';
import '../presentation/screen/nav_screen.dart';

class RouteHelper {

  static const String splashScreen = '/splash-screen';
  static const String initial = '/';
  static const String signIn = '/sign-in';

  static getSplashScreen() => splashScreen;
  static getInitialScreen()=> initial;
  static getSignInPage()=>signIn;
  static List<GetPage> pages = [
    GetPage(
      name:splashScreen,page:()=>const SplashScreen()
    ),
    GetPage(
      name:initial,page:()=>const NavBar(),
    ),
    GetPage(
      name:signIn,page:()=>  SignIn(),transition:Transition.fadeIn
    )
  ];

}