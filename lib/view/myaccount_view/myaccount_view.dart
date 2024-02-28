import 'package:ecommerce/resources/appcolors/app_colors.dart';
import 'package:ecommerce/utilities/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:ecommerce/utilities/custom_scaffold/custom_scaffold.dart';
import 'package:ecommerce/view/auth_view/auth_view.dart';
import 'package:ecommerce/view/welcome_view/welcome_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/AppIcons/appicons.dart';
import '../../resources/app_images/appimages.dart';
class MyaccountView extends StatefulWidget {
  const MyaccountView({super.key});

  @override
  State<MyaccountView> createState() => _MyaccountViewState();
}

class _MyaccountViewState extends State<MyaccountView> {
  
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
             height: Get.height*0.07,
              width: Get.width,
              decoration: BoxDecoration(
                color: Appcolors.green,
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text('MartOfTech',style: TextStyle(color: Appcolors.whiteA700,fontSize: 14,),),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 7.0),
                              child: Text('sohaibsyed42@gmail.com',style: TextStyle(color: Appcolors.whiteA700,fontWeight: FontWeight.bold,fontSize: 12),),
                            ),
                          ],
                  ),
         Spacer(),
                  Expanded(
                    child: IconButton(onPressed: ()async{
                      FirebaseAuth auth= FirebaseAuth.instance;
                      auth.signOut();
                      Get.to(AuthView());
                    }, icon:Icon(AppIcons.logout,color: Appcolors.whiteA700,),
                        ),
                  )
                ],
              ),
            ),
            Container(
              height: Get.height*0.25,
              width: Get.width,
              decoration: BoxDecoration(
                image:DecorationImage(image: AssetImage(AppImages.saled),fit: BoxFit.cover),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,10,8.0,5),
              child:
              Text('My Account',style: TextStyle(fontSize: 14,color: Appcolors.black),),
            ),
             ListTile(
               leading: Icon(AppIcons.person_2,color: Appcolors.green,size: 12,),
               title: Text('Home',style: TextStyle(fontSize: 12,color: Appcolors.black),),
               trailing:TextButton(onPressed: (){}, child: Icon(AppIcons.back_arrow_ios,color: Appcolors.green,size: 12,),) ,
             ),
            ListTile(
              leading: Icon(AppIcons.address,color: Appcolors.green,size: 12,),
              title: Text('Addresses',style: TextStyle(fontSize: 12,color: Appcolors.black),),
              trailing:TextButton(onPressed: (){}, child: Icon(AppIcons.back_arrow_ios,color: Appcolors.green,size: 12,),) ,
            ),
            ListTile(
              leading: Icon(AppIcons.payment,color: Appcolors.green,size: 14,),
              title: Text('Payment',style: TextStyle(fontSize: 12,color: Appcolors.black),),
              trailing:TextButton(onPressed: (){}, child: Icon(AppIcons.back_arrow_ios,color: Appcolors.green,size: 12,),) ,
            ),
            ListTile(
              leading: Icon(AppIcons.shoping_bag,color: Appcolors.green,size: 14,),
              title: Text('Order',style: TextStyle(fontSize: 12,color: Appcolors.black),),
              trailing:TextButton(onPressed: (){}, child: Icon(AppIcons.back_arrow_ios,color: Appcolors.green,size: 12,),) ,
            ),
           Padding(
              padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
              child:
              Text('Settings',style: TextStyle(fontSize: 14,color: Appcolors.black),),
            ),
            ListTile(
              leading: Icon(AppIcons.person_2,color: Appcolors.green,size: 18,),
              title: Text('languages',style: TextStyle(fontSize: 12,color: Appcolors.black),),
              trailing:TextButton(onPressed: (){}, child: Icon(AppIcons.back_arrow_ios,color: Appcolors.green,size: 12,),) ,
            ),
          ],
        ),
      ),
     ShowBottomNavigationbar: true,
    );
  }
}
