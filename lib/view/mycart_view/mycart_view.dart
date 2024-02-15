import 'package:ecommerce/utilities/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../utilities/custom_scaffold/custom_scaffold.dart';
class MycartView extends StatefulWidget {
  const MycartView({super.key});

  @override
  State<MycartView> createState() => _MycartViewState();
}

class _MycartViewState extends State<MycartView> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      initialindex: 3,
      body: Center(
        child:Text('My Cart'),
      ),
      ShowBottomNavigationbar: true
    );
  }
}
