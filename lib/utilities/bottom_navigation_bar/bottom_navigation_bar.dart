import 'package:ecommerce/view/foods_view/foods_view.dart';
import 'package:ecommerce/view/homeview/homeviw.dart';
import 'package:ecommerce/view/myaccount_view/myaccount_view.dart';
import 'package:ecommerce/view/mycart_view/mycart_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/AppIcons/appicons.dart';
import '../../resources/appcolors/app_colors.dart';

class BottomNavBar extends StatefulWidget {
  final int initialindex;
  const BottomNavBar({super.key,required this.initialindex});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
   int selectedIndex=0;
  /*final List<Widget> _pages = [

   //  NotificationSettingView(),
    // Add more pages as needed

  ];*/
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // selectedIndex=widget.initialindex;
  }
void _ontaped (index) {
  setState(() {
    selectedIndex = index;
  });
  switch(index){
    case 0:
      Navigatetoroute(context, '/homeView', HomeView());
    case 1:
      Navigatetoroute(context, '/foodsView', FoodsView());
    case 2:
      Navigatetoroute(context, '/myaccountView', MyaccountView());
      case 3:
    Navigatetoroute(context, '/mycartView', MycartView());


  }
}
  void Navigatetoroute(context, String routename,Widget screen){
    final String? currentroutename=ModalRoute.of(context)?.settings.name;
    bool routeexist=currentroutename==routename;
    if(routeexist){
      Navigator.popUntil(context,ModalRoute.withName(routename));
    }
    else
      {
        Navigator.pushReplacement(context,
            MaterialPageRoute(
              builder:(context)=>screen,
              settings: RouteSettings(name: routename)
        ));

      }
  }

  @override
  Widget build(BuildContext context) {
    print("index$selectedIndex");
    return BottomNavigationBar(
        backgroundColor: Colors.white,
      selectedIconTheme: IconThemeData(
        //color: Appcolors.green,
        size: 14,


      ),
     // selectedItemColor: Colors.green,
      unselectedIconTheme: IconThemeData(
        //color: Appcolors.gray,
        size: 14,
       // shadows: Shadow(color: AppColors.green,blurRadius: 23)
      ),
    type: BottomNavigationBarType.fixed,
      //currentIndex: selectedIndex,
      onTap:_ontaped,

      items: [
        BottomNavigationBarItem(

          icon: Icon(AppIcons.home_icon,
            color:selectedIndex==0? Appcolors.green:Appcolors.gray,
          ),
          label: 'home',
        ),
        BottomNavigationBarItem(
          label: 'Food',
          icon: Icon(AppIcons.food_bank,
            color:selectedIndex==1? Appcolors.green:Appcolors.gray,
          ),
        ),
        BottomNavigationBarItem(
          label: 'My Account',
          icon: Icon(AppIcons.person_2,
            color:selectedIndex==2? Appcolors.green:Appcolors.gray,
          ),
        ),

        BottomNavigationBarItem(
          label: 'Cart',
        //  icon:Icon(AppIcons.person),
          icon:Icon(AppIcons.shoping_cart,
            color:selectedIndex==3? Appcolors.green:Appcolors.gray,
          ),

        ),
        // Add more BottomNavigationBarItems as needed
      ],
    );
  }
}

