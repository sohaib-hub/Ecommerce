import 'dart:async';
import 'package:ecommerce/resources/app_images/appimages.dart';
import 'package:ecommerce/view/welcome_view/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../resources/appcolors/app_colors.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState() ;
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin{
  @override
  // FirebaseAuth auth =FirebaseAuth.instance;
  late AnimationController _animationController;
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController=AnimationController(
        vsync: this,
      duration:  const Duration(seconds: 2)
    );
    _animationController.forward();
    Timer(const Duration(seconds: 5),(){
       Get.to(WelcomeView());

    });

    /*// final user=auth.currentUser;
    if(user!=null){
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScr()),
      );
    });

  }else{
      Future.delayed(Duration(seconds: 5), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignUpView()),
        );
      });*/
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.greenAccent,
      body:
      Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ScaleTransition(
              scale: Tween<double>(begin: 0,end: 1).animate(
                CurvedAnimation(
                    parent: _animationController,
                    curve: Curves.easeOut)
              ),
            child:Image.asset(AppImages.app_logo, height: 200, width: 200,) ,
          ),
          const SizedBox(height: 50,),
           ScaleTransition(
             scale: Tween<double>(begin: 0,end: 1).animate(
                 CurvedAnimation(
                     parent: _animationController,
                     curve: Curves.linear)
             ),
             child: Text('E-Cart',
               style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color:Appcolors.black),),
           ),
        ],
      )),
      bottomNavigationBar:   SizedBox(
        height: 40,
        width: Get.width,
        child: Text('Powered by MartOfTech',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16,fontStyle: FontStyle.italic,color:Appcolors.black),

          ),
        ),

    );
  }
}
