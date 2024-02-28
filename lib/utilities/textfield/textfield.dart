import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/appcolors/app_colors.dart';
class CustomTextField extends StatelessWidget {
  TextEditingController? data_controller;
  String? lable_text;
  Icon? prefix_icon;
  Widget? sufix;
  bool obsecure;
  final GlobalKey? cheak_validator_key;

   CustomTextField({super.key,
   this.data_controller,
     this.lable_text,
     this.prefix_icon,
     this.sufix,
    required this.obsecure,
     this.cheak_validator_key,

   });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cheak_validator_key,
      child: SizedBox(
        height: MediaQuery.of(context).size.height*0.065,
        child: TextFormField(
          controller: data_controller,
          style: TextStyle(color:Appcolors.black,),

          decoration: InputDecoration(
           border: InputBorder.none,

            labelText: lable_text,
            prefixIcon: prefix_icon,
            labelStyle: TextStyle(fontSize: 12),
              suffix: sufix,

          ),
          obscureText: obsecure,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Enter value';
            }
          },
        ),
      ),
    );
  }
}
