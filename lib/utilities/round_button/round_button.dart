import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
class RoundButton extends StatelessWidget {
  String title;
  double?  title_size;
  double button_height,button_width;
  Color? background_color;
      Color? title_color;
      Icon? button_icon;
      double? button_icon_size;
  VoidCallback onpress;
   RoundButton({super.key,
  required this.title,
     this.title_color,
     this.title_size,
     required this.button_height,
     required this.button_width,
     this.background_color,
     this.button_icon,
     this.button_icon_size,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: button_height,
        width: button_width,
      // height
      //     :Get.height*0.055,width: Get.width*0.5,
      child: ElevatedButton(onPressed:onpress,
          style: ElevatedButton.styleFrom(
              backgroundColor:background_color),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,
                style: TextStyle(
                    color: title_color,
                    fontSize:title_size,
                    fontWeight: FontWeight.bold
                ),),
              Icon(button_icon?.icon,size: button_icon_size,color: title_color,)
            ],
          )),
    );
  }
}
