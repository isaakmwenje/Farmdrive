import 'package:flutter/material.dart';
import 'package:untitled3/presentation/screen/records_screen.dart';

import 'home_screen.dart';
import 'locator_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int selectedIndex = 0;

  final List _screens = [
    const HomeScreen(),
    const LocatorScreen(),
    const RecordsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children:_screens.asMap().map((i,screen) =>MapEntry(
          i,Offstage(
          offstage:selectedIndex !=  i,
          child:screen,
        )
        )).values.toList()
      ),
      bottomNavigationBar:BottomNavigationBar(
        currentIndex:selectedIndex,
        onTap:(int i){
          setState(()
          {
            selectedIndex = i;
          });
        },

        items:const [
          BottomNavigationBarItem(
            icon:Icon(Icons.home_filled),
            label:'home',
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.explore),
            label:'locator',
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.subscriptions),
            label:'records',
          )
        ]
      )
    );
  }
}
