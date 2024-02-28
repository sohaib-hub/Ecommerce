
 import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../resources/app_images/appimages.dart';

class HomeviewModel extends GetxController with WidgetsBindingObserver{

 List<itemdetail>items=[];
 String searchtext='';
 Future<void> onInit() async {
  super.onInit();
  items=[
   itemdetail(title:'abc jelly', image:  AppImages.jelly, price: 199),
   itemdetail(title:'Office', image: AppImages.office , price: 200),
   itemdetail(title:'CD', image: AppImages.cd, price: 150),
   itemdetail(title:'polish', image: AppImages.polish, price: 100),
   itemdetail(title:'machine', image: AppImages.machine, price: 5000),
   itemdetail(title:'vegetable', image: AppImages.app_logo, price: 160),
   itemdetail(title:'OFF', image: AppImages.shoping3, price: 160),
   itemdetail(title:'Buy', image: AppImages.basket, price: 20),
   itemdetail(title:'Sale', image: AppImages.shoping1, price: 10),
   itemdetail(title:'Saled', image: AppImages.saled, price: 150),
   itemdetail(title:'Chicken', image: AppImages.spicy_dish, price: 350),
   itemdetail(title:'Buy', image: AppImages.basket, price: 20),
   itemdetail(title:'Sale', image: AppImages.shoping1, price: 10),
  ];
 }
}
 class itemdetail{
  String title;
  double price;
  String image;
  int currentindex;
  itemdetail({
   required  this.title,
   required   this.image,
   required  this.price,
   this.currentindex=0,
  });
 }