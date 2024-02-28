
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../resources/app_animations/app_anim.dart';

class WelcomviewModel extends GetxController{

  RxList<WelcomeSlider>welcomslider_list=[
    WelcomeSlider(
      Appanimation.sale_anim,
      'Shop All You Want',
      'Select from a wide range of verity',
    ),
    WelcomeSlider(
        Appanimation.basket_anim,
        'Shop All You Want',
        'Select from a wide range of verity'
    ),
    WelcomeSlider(
        Appanimation.shoping_anim,
        'The Greatest Shop Journey ',
        'Select from a wide range of verity'
    ),

  ].obs;


}

class WelcomeSlider{
  final String title;
  final String descripton;
  final String image;
  WelcomeSlider(
      this.image,
      this.title,
      this.descripton,
      );


}