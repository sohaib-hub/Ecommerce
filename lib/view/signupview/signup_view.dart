import 'package:ecommerce/utilities/round_button/round_button.dart';
import 'package:ecommerce/utilities/textfield/textfield.dart';
import 'package:ecommerce/view/Login%20view/login_view.dart';
import 'package:ecommerce/viewmodel/signup_model/signup_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/AppIcons/appicons.dart';
import '../../resources/appcolors/app_colors.dart';

class SignUpview extends StatelessWidget {
   SignUpview({super.key});
 SignupviewModel _signupviewModel=SignupviewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.greenAccent,
     body: SafeArea(
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text('SignUp',style: TextStyle(color: Appcolors.black,fontSize: 16,fontWeight: FontWeight.bold),),
             Text('Please Sign in to Continue.',
               style: TextStyle(color: Appcolors.gray,fontSize: 12),),
             SizedBox(height: Get.height*0.05,),
             CustomTextField(
               cheak_validator_key: _signupviewModel.email_key,
               obsecure: false,
               data_controller: _signupviewModel.emailcontroller,
               lable_text: 'Email',
               prefix_icon:Icon(AppIcons.mail),
             ),
             SizedBox(height: Get.height*0.03,),
             CustomTextField(
               cheak_validator_key: _signupviewModel.password_key,
               data_controller:_signupviewModel.passwordcontroller,
               lable_text: 'password',
               obsecure: true,
               prefix_icon:Icon(AppIcons.password),

             ),
             SizedBox(height: Get.height*0.03,),
             Align(
               alignment: Alignment.bottomRight,
               child: RoundButton(title: 'SignUp',
                   title_size: 12,
                   button_icon_size: 14,
                   background_color: Appcolors.greenAccent,
                   title_color: Appcolors.black,
                   button_height:MediaQuery.of(context).size.height*0.055,
                   button_width:MediaQuery.of(context).size.width*0.35,
                   button_icon: Icon(AppIcons.far_arrow),
                   onpress: _signupviewModel.onpressed),
             )
           ],
         ),
       ),
     ) ,
     bottomNavigationBar: SizedBox(

       height: Get.height*0.05,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text('have an account?',style: TextStyle(color: Appcolors.green,fontSize: 10),),
           TextButton(onPressed: (){Get.to(LogInview());},
               child:Text('login',style: TextStyle(color: Appcolors.black,fontSize: 12),),
           )

         ],
       ),
     ),
    );
  }
}
