import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/AppIcons/appicons.dart';
import '../../resources/appcolors/app_colors.dart';
import '../../utilities/round_button/round_button.dart';
import '../../utilities/textfield/textfield.dart';
import '../Login view/login_view.dart';
class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
   final emailcontroller=TextEditingController();
   var email_key=GlobalKey<FormState>();
   FirebaseAuth fb=  FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){Navigator.pop(context);},
    icon: Icon(AppIcons.back_arrow),
        )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height*0.05,
              ),
              Text('Reset Password',style: TextStyle(color: Appcolors.black,fontSize: 22,fontWeight: FontWeight.bold),),
              SizedBox(height: Get.height*0.05,),
              CustomTextField(
                cheak_validator_key: email_key,
                obsecure: false,
                data_controller: emailcontroller,
                lable_text: 'Email',
                prefix_icon:Icon(AppIcons.mail),
              ),
              SizedBox(height: Get.height*0.05,),
              Align(
                alignment: Alignment.bottomRight,
                child: RoundButton(title: 'Reset',
                    title_size: 15,
                    background_color: Appcolors.greenAccent,
                    title_color: Appcolors.black,
                    button_height: Get.height*0.055,
                    button_width:Get.width*0.32,
                    button_icon: Icon(AppIcons.far_arrow),
                    onpress: ()async{

                      if(email_key.currentState!.validate()
                      ){
                        fb.sendPasswordResetEmail(email: emailcontroller.text).then(
                                (value){
                                  Get.snackbar('Password reset', "new password send on the email",

                                  );
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
            Text('Know password?',style: TextStyle(color: Appcolors.green,fontSize: 14),),
            TextButton(onPressed: (){Get.to(LogInview());},
              child:Text('login',style: TextStyle(color: Appcolors.black,fontSize: 14),),
            )

          ],
        ),
      ),
    );;
  }
}
