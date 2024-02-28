
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../view/welcome_view/welcome_view.dart';

class LoginviewModel extends GetxController with WidgetsBindingObserver{

  final emailcontroller=TextEditingController();
  final passwordcontroller=TextEditingController();
  var email_key = GlobalKey<FormState>();
  var password_key = GlobalKey<FormState>();

   void onpressed()async{
    FirebaseAuth fb= await FirebaseAuth.instance;
    if(email_key.currentState!.validate()
        && password_key.currentState!.validate()
    ){
      fb.signInWithEmailAndPassword(email: emailcontroller.text,
          password: passwordcontroller.text).then((value) {
        Get.to(WelcomeView());
        Get.snackbar('Success', "you are successfully login");
      }).onError((error, stackTrace)
      {
        Get.snackbar('error', error.toString());
      }
      );

    }
  }
}