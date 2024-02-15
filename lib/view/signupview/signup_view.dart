import 'package:ecommerce/utilities/round_button/round_button.dart';
import 'package:ecommerce/utilities/textfield/textfield.dart';
import 'package:ecommerce/view/Login%20view/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/AppIcons/appicons.dart';
import '../../resources/appcolors/app_colors.dart';

class SignUpview extends StatelessWidget {
   SignUpview({super.key});
  final emailcontroller=TextEditingController();
  final passwordcontroller=TextEditingController();
   var email_key = GlobalKey<FormState>();
   var password_key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text('SignUp',style: TextStyle(color: Appcolors.black,fontSize: 22,fontWeight: FontWeight.bold),),
             Text('Please Sign in to Continue.',
               style: TextStyle(color: Appcolors.gray,fontSize: 18),),
             SizedBox(height: Get.height*0.05,),
             CustomTextField(
               cheak_validator_key: email_key,
               obsecure: false,
               data_controller: emailcontroller,
               lable_text: 'Email',
               prefix_icon:Icon(AppIcons.mail),
             ),
             SizedBox(height: Get.height*0.03,),
             CustomTextField(
               cheak_validator_key: password_key,
               data_controller:passwordcontroller,
               lable_text: 'password',
               obsecure: true,
               prefix_icon:Icon(AppIcons.password),

             ),
             SizedBox(height: Get.height*0.03,),
             Align(
               alignment: Alignment.bottomRight,
               child: RoundButton(title: 'SignUp',
                   background_color: Appcolors.greenAccent,
                   title_color: Appcolors.black,
                   button_height: Get.height*0.055,
                   button_width:Get.width*0.33,
                   button_icon: Icon(AppIcons.far_arrow),
                   onpress: ()async{
                  FirebaseAuth fb= await FirebaseAuth.instance;
                     if(email_key.currentState!.validate()
                         && password_key.currentState!.validate()
                     ){
                       fb.createUserWithEmailAndPassword(
                           email: emailcontroller.text,
                           password:passwordcontroller.text,
                       ).then((value){Get.snackbar('Account Created', "you are successfully Create your account",);
                           Get.to(LogInview());}
                       ).onError((error, stackTrace) {
                         Get.snackbar('error', error.toString());
                       });

                     }
                   }),
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
           Text('have an account?',style: TextStyle(color: Appcolors.green,fontSize: 14),),
           TextButton(onPressed: (){Get.to(LogInview());},
               child:Text('login',style: TextStyle(color: Appcolors.black,fontSize: 14),),
           )

         ],
       ),
     ),
    );
  }
}
