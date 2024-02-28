import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../view/Login view/login_view.dart';
class SignupviewModel extends GetxController with WidgetsBindingObserver{

  final emailcontroller=TextEditingController();
  final passwordcontroller=TextEditingController();
  var email_key = GlobalKey<FormState>();
  var password_key = GlobalKey<FormState>();

  void onpressed()async{
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
}
}