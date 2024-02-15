import 'package:ecommerce/resources/AppIcons/appicons.dart';
import 'package:ecommerce/resources/app_images/appimages.dart';
import 'package:ecommerce/resources/appcolors/app_colors.dart';
import 'package:ecommerce/utilities/round_button/round_button.dart';
import 'package:ecommerce/view/Login%20view/login_view.dart';
import 'package:ecommerce/view/signupview/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Appcolors.black,
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.background3,),fit: BoxFit.fitHeight)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Get.height*0.07,),
              Image.asset(AppImages.app_logo,height: Get.height*0.25,width: Get.width*0.5,fit:  BoxFit.cover,),
              SizedBox(height: Get.height*0.07,),
              /*SizedBox(
                height
                :Get.height*0.055,width: Get.width*0.5,
                child: ElevatedButton(onPressed: (){},
                    //style: ButtonStyle(backgroundColor:Appcolors,),
                    child: Text('SignUp')),
              ),*/
              RoundButton(title: 'SignUp',
                  button_height: Get.height*0.055,
                  button_width: Get.width*0.5,
                  background_color: Appcolors.greenAccent,
                  title_color: Appcolors.black,
                  button_icon_size: null,
                  button_icon: Icon(AppIcons.far_arrow),

                  onpress:(){
                Get.to(SignUpview());
                  }),
              SizedBox(height: Get.height*0.05,),
              RoundButton(title: 'Sign in',
                  button_height: Get.height*0.055,
                  button_width: Get.width*0.5,
                  background_color: Appcolors.greenAccent,
                  title_color: Appcolors.black,
                  //button_icon_size: null,
                  button_icon: Icon(AppIcons.far_arrow),

                  onpress:(){
                Get.to(LogInview());
                  }),
              /*SizedBox(
               height: Get.height*0.055,width: Get.width*0.5,
                child: ElevatedButton(onPressed: (){},
                    child: Text('Sign in')),*/

              Padding(
                padding: const EdgeInsets.only(bottom: 30,right: 30),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(onPressed: (){
                    Get.to(LogInview());
                  },
                      child:Text('Skip',style: TextStyle(color: Appcolors.yellow,fontSize: 20),)),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
