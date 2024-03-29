import 'package:ecommerce/utilities/round_button/round_button.dart';
import 'package:ecommerce/utilities/textfield/textfield.dart';
import 'package:ecommerce/view/forgot_password/forgot_password_view.dart';
import 'package:ecommerce/view/homeview/homeviw.dart';
import 'package:ecommerce/view/signupview/signup_view.dart';
import 'package:ecommerce/view/welcome_view/welcome_view.dart';
import 'package:ecommerce/viewmodel/login_view_model/long_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/AppIcons/appicons.dart';
import '../../resources/appcolors/app_colors.dart';

class LogInview extends StatelessWidget {
   LogInview({super.key});
   LoginviewModel _loginviewModel=LoginviewModel();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Appcolors.greenAccent,
     body: SafeArea(
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Expanded(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('Login',style: TextStyle(color: Appcolors.black,fontSize: 18,fontWeight: FontWeight.bold),),
               Text('Please Sign in to Continue.',
                 style: TextStyle(color: Appcolors.gray,fontSize: 12),),
               SizedBox(height: Get.height*0.05,),
               CustomTextField(
                 obsecure: false,
                 data_controller: _loginviewModel.emailcontroller,
                 cheak_validator_key: _loginviewModel.email_key,
                 lable_text: 'Email',
                 prefix_icon:Icon(AppIcons.mail),
               ),
               SizedBox(height: Get.height*0.03,),
               CustomTextField(
                 data_controller:_loginviewModel.passwordcontroller,
                 cheak_validator_key: _loginviewModel.password_key,
                 lable_text: 'password',
                 obsecure: true,
                 prefix_icon:Icon(AppIcons.password),
                 sufix: InkWell(
                 onTap: (){
                   Get.to(ForgotPasswordView());
                 },
                 child: Text('FORGOT',style: TextStyle(color:Appcolors.green,fontSize: 10),)),
           
               ),
               SizedBox(height: Get.height*0.03,),
               Align(
                 alignment: Alignment.bottomRight,
                 child: RoundButton(
                     title: 'LogIn',
                     background_color: Appcolors.greenAccent,
                     title_color: Appcolors.black,
                     button_height:MediaQuery.of(context).size.height*0.056,
                     //Get.height*0.055,
                     button_width:MediaQuery.of(context).size.width*0.35,
                     //Get.width*0.3,
                     button_icon: Icon(AppIcons.far_arrow),
                     onpress: _loginviewModel.onpressed
           
                        /* ()async{
                       FirebaseAuth fb= await FirebaseAuth.instance;
                       if(_loginviewModel.email_key.currentState!.validate()
                           && _loginviewModel.password_key.currentState!.validate()
                       ){
                         fb.signInWithEmailAndPassword(email: _loginviewModel.emailcontroller.text,
                             password:_loginviewModel. passwordcontroller.text).then((value) {
                         Get.to(WelcomeView());
                             Get.snackbar('Success', "you are successfully login");
                             }).onError((error, stackTrace)
                         {
                           Get.snackbar('error', error.toString());
                         }
                         );
           
                       }
                     }*/
                     ),
               )
             ],
           ),
         ),
       ),
     ) ,
     bottomNavigationBar: SizedBox(
       height: Get.height*0.05,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text('Dont\'t have an account?',style: TextStyle(color: Appcolors.green,fontSize: 10),),
           TextButton(onPressed: (){Get.to(SignUpview());},
               child:Text('SignUp',style: TextStyle(color: Appcolors.black,fontSize: 12),),
           )

         ],
       ),
     ),
    );
  }
}
