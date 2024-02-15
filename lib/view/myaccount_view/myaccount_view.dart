import 'package:ecommerce/utilities/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:ecommerce/utilities/custom_scaffold/custom_scaffold.dart';
import 'package:flutter/material.dart';
class MyaccountView extends StatefulWidget {
  const MyaccountView({super.key});

  @override
  State<MyaccountView> createState() => _MyaccountViewState();
}

class _MyaccountViewState extends State<MyaccountView> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
initialindex: 2,
      body: Center(
        child:Text('My Account')
      ),
     ShowBottomNavigationbar: true,
    );
  }
}
