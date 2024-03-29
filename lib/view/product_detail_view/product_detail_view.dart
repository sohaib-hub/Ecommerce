import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/resources/AppIcons/appicons.dart';
import 'package:ecommerce/utilities/cart_provider/cart_provider.dart';
import 'package:ecommerce/view/homeview/homeviw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/app_images/appimages.dart';
import '../../resources/appcolors/app_colors.dart';
class ProductDetailView extends StatefulWidget {
  String image;
  String title;
  double price;
   ProductDetailView({super.key,
  required this.image,
    required this.title,
    required this.price
  });

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  int selectedbuttonindex=2;
   CartController cartController = Get.put(CartController());

  void addToCart() {
    CartItem newItem = CartItem(image:widget.image??'no image avalible',
        title: widget.title??'', price:widget.price, quantity: 0);
    cartController.addToCart(newItem);
  }
  void selectedbutton(int index){
    setState(() {
      selectedbuttonindex=index;
    });
  }
  //List<String>image=[AppImages.jelly,AppImages.machine,AppImages.cd];
  int currebtslide=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Appcolors.whiteA700,
            leading: IconButton(icon:Icon (AppIcons.back_arrow,),
            onPressed: (){
              Navigator.pop(context);
            },),
          ),
          body: Column(
            children: [
              Container(
                height: Get.height*0.3,
               width: Get.width*0.8,
                child:Image.asset(widget.image),
                /*CarouselSlider(
                  options: CarouselOptions(height: 400.0,
                    enlargeCenterPage: true,
                    onPageChanged: (index, _){
                     setState(() {
                       currebtslide=index;
                     });
                    }
                  ),

                  items: image.map((image) {
                    return Builder(

                      builder: (BuildContext context) {
                        return Image.asset(image,fit: BoxFit.fill,);
                      },
                    );
                  }).toList(),
                ),*/

              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(13.0,10,13,10),
                child: Row(

                  children: [
                    Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold,color: Appcolors.black,fontSize: 16),),
                  const   Spacer(),
                    Text('\$${widget.price}',style: TextStyle(color: Appcolors.green,fontSize: 16),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                alignment: Alignment.topLeft,
                  color: Appcolors.whiteA700,
                  child:   Text('Product Description',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Appcolors.black),),
                ),
              ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(

                        child: Container(
                          alignment: Alignment.topLeft,

                          child:   Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('-> This is so amazing',style: TextStyle(fontSize: 14,color: Appcolors.black),),
                              Text('-> This is so amazing',style: TextStyle(fontSize: 14,color: Appcolors.black),),
                              Text('-> This is so amazing',style: TextStyle(fontSize: 14,color: Appcolors.black),),
                              Text('-> This is so amazing',style: TextStyle(fontSize: 14,color: Appcolors.black),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
          bottomNavigationBar: Row(
            children: [
              Expanded(child:
              Container(
                height: Get.height*0.06,
                child: ElevatedButton(onPressed: (){
                  selectedbutton(1);

                },
                  style: ElevatedButton.styleFrom(
                    primary: selectedbuttonindex==1?Appcolors.green:Appcolors.whiteA700,

                  ),
                child: Text('Resel',style: TextStyle(color:selectedbuttonindex==1?Appcolors.whiteA700:Appcolors.black,),
                ),
              ))),
              Expanded(child:
              Container(
                  height: Get.height*0.06,
                  child: ElevatedButton(
                    onPressed: (){
                    selectedbutton(2);
                    addToCart();
                    Get.snackbar('Added','',
                    );
                    Get.to(const HomeView());
                  },
                    style: ElevatedButton.styleFrom(
                      primary: selectedbuttonindex==2?Appcolors.green:Appcolors.whiteA700,

                    ),
                    child: Text('Add',style: TextStyle(color:selectedbuttonindex==2?Appcolors.whiteA700:Appcolors.black,),
                    ),
                  )))
            ],
          ),
              )



    );
  }
}
