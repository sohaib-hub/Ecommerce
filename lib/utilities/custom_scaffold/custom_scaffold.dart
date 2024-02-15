import 'package:ecommerce/utilities/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
class CustomScaffold extends StatelessWidget {
  //Widget? appbar;
   Widget? body;
   bool ShowBottomNavigationbar;
   int initialindex;
   CustomScaffold({super.key,
    // this.appbar,
     this.body,
     this.ShowBottomNavigationbar=true,
      this.initialindex=0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar:appbar,
      body: body,
bottomNavigationBar:BottomNavBar(initialindex:initialindex.toInt(),)
//ShowBottomNavigationbar?BottomNavBar(initialindex: initialindex):null,
    );
  }
}
