import 'package:ecommerce/resources/app_images/appimages.dart';
import 'package:ecommerce/view/auth_view/auth_view.dart';
import 'package:ecommerce/view/welcome_view/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/appcolors/app_colors.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  PageController _pageController=PageController();
   int currentpage=0;
  List<WelcomeSlider>welcomslider_list=[
 WelcomeSlider(
     AppImages.shoping1,
     'Shop All You Want',
     'Select from a wide range of verity',
 ),
    WelcomeSlider(
        AppImages.app_logo,
        'Shop All You Want',
        'Select from a wide range of verity'
    ),
    WelcomeSlider(
        AppImages.shoping3,
        'The Greatest Shop Journey ',
        'Select from a wide range of verity'
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.greenAccent,
      body: SafeArea(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: TextButton(onPressed: (){
              Get.to(AuthView());
            },
                child:Text('Skip',style: TextStyle(color: Appcolors.redA200,fontSize: 16),)),
          ),
         const  SizedBox(height: 30,),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
                itemCount: welcomslider_list.length,
                onPageChanged: (value){
                setState(() {
                  currentpage=value;
                });
                },
                itemBuilder: (context,index)
            
                {
                  final item=welcomslider_list[index];
              return Column(
                children: [
                  Image.asset(item.image,height: Get.height*0.6,width:Get.width*0.9,fit: BoxFit.fill,),
                    //child:Image.asset(AppImages.shoping1,height: 350,) ),
                 //SizedBox(height: 10,),
                  Text(item.title,
                  style: Theme.of(context).
                    textTheme.headlineMedium!.copyWith(
                    color: Appcolors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
            
                  ),
                  ),
                  // SizedBox(height: 5,),
                  Text(item.descripton,
                    style: Theme.of(context).
                    textTheme.bodyMedium!.copyWith(
                      color: Appcolors.gray,
                      fontSize: 14,
                    ),
                  ),
                ],
              );
            }),
          )
        ],
      )),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right:5.0),
                    child: AnimatedContainer(
                      duration: const Duration(microseconds: 150),
                      height:Get.height*0.01,
                      width: Get.width*0.04,
                      decoration: BoxDecoration(
                        color: currentpage==index? Appcolors.redA200:Appcolors.gray,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  );
                }),
              ),
            ),
            FloatingActionButton(
              backgroundColor: Appcolors.red,
              onPressed: (){
               if(currentpage<welcomslider_list.length-1){
                 _pageController.nextPage(
                     duration: const Duration(
                         microseconds: 300
                     ),
                     curve: Curves.easeOut
                 );
               }else{
                 //Get.to(page)
               }
              },

            child: currentpage!=welcomslider_list.length-1?
            Icon(Icons.arrow_right_alt,color: Appcolors.whiteA700,):
              InkWell(child: Icon(Icons.done,color: Appcolors.whiteA700,),
              onTap: (){
                Get.to(AuthView());
              },),

            ),
          ],
        ),
      ),
    );
  }
}

//
class WelcomeSlider{
   final String title;
   final String descripton;
   final String image;
  WelcomeSlider(
      this.image,
      this.title,
      this.descripton,
      );


}