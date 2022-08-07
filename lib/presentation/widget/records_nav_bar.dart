import 'package:flutter/material.dart';
import 'package:untitled3/presentation/widget/records_analysis_caoresel.dart';
import 'package:untitled3/presentation/widget/records_notification_caoresel.dart';
import 'package:untitled3/presentation/widget/records_orders_caoresel.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

List<Widget>   widgets = [
  const Text(
    'ORDERS',
    style:TextStyle(
      fontWeight: FontWeight.w600,
      fontSize:18,
    )
  ),
  const Text(
      'ANALYSIS',
      style:TextStyle(
        fontWeight: FontWeight.w600,
        fontSize:18,
      )
  ),
  const Text(
      'NOTIFICATION',
      style:TextStyle(
        fontWeight: FontWeight.w600,
        fontSize:18,
      )
  ),
];
class _NavBarState extends State<NavBar> {
  List<Widget> screens = [
    const OrdersCaoresel(),
    const AnalysisCaoresel(),
    const NotificationCaoresel(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Text(
        'bitch please lambo'
      )
    );
  }
}
