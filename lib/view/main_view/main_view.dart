import 'package:ecommerce/utilities/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:ecommerce/utilities/custom_scaffold/custom_scaffold.dart';
import 'package:ecommerce/view/homeview/homeviw.dart';
import 'package:flutter/material.dart';

import '../../resources/AppIcons/appicons.dart';
class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  void contro(){

  }
  int index=0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      /* appBar: AppBar(backgroundColor: Colors.transparent,
      leading: IconButton(onPressed: (){Navigator.pop(context);},
      icon: Icon(AppIcons.back_arrow),

       ),
      ),*/

        bottomNavigationBar: BottomNavBar(initialindex: 0,)
    );
  }
}
