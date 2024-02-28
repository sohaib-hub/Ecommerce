

import 'package:ecommerce/resources/app_images/appimages.dart';
import 'package:ecommerce/utilities/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:ecommerce/utilities/custom_scaffold/custom_scaffold.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../resources/AppIcons/appicons.dart';
import '../../resources/appcolors/app_colors.dart';
class FoodsView extends StatefulWidget {
  const FoodsView({super.key});

  @override
  State<FoodsView> createState() => _FoodsViewState();
}

class _FoodsViewState extends State<FoodsView> {
  List<String>imageurl=[];
  List<String>title=[
    'Fast Food','salad','Fries exe'
  ];
  List<String>Subtitle=[
    'American dish','Rushions','Spicy dish'
  ];
  List<String>price=[
    '\$15','\$8','\$10'
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(imageurl.isEmpty){
    fetchimage();}
    else if(imageurl.isNotEmpty){
      imageurl.toList();
    }

  }
   void fetchimage()async{
    FirebaseStorage storage=FirebaseStorage.instance;
    for(int i=1;i<=3;i++){
      Reference ref=storage.ref().child('f$i.jpg');
      String downloadurl=await ref.getDownloadURL();
      setState(() {
        imageurl.add(downloadurl);
      });
    }
   }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body:SafeArea(
        child: Container(
          color: Appcolors.pink300,
          child: Column(
            children: [
              Container(
                width: Get.width,
                height: Get.height*0.12,
                color: Appcolors.green,
                alignment: Alignment.center,
                child: Container(
                  height: Get.height*0.07,
                  width: Get.width,
                  color: Appcolors.whiteA700,
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Container(
                          height: Get.height*0.08,
                          width: Get.width*0.8,
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(AppIcons.search),
                                hintText: 'search Restaurant & dishes'
                            ),
                            onChanged: (value){
                              setState(() {
                               // searchtext=value;
                              });
                            },
                          ),
                        ),
                      ),
                      IconButton(onPressed: (){},
                          icon: Icon(AppIcons.filter_list))
                    ],
                  ),

                ),

              ),
              Expanded(child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                  itemCount: imageurl.length,
                  itemBuilder:(context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        height: Get.height*0.6,
                      decoration: BoxDecoration(
                        color: Appcolors.blue,
                        image: DecorationImage(image:NetworkImage(imageurl[index]),fit: BoxFit.cover,

                        )
                      ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         crossAxisAlignment: CrossAxisAlignment.end,
                         children:[
                           Column(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [


                          Container(
                           alignment: Alignment.center,
                           height: Get.height*0.04,
                           width: Get.width*0.25,
                           decoration: BoxDecoration(
                             color: Appcolors.green,
                             borderRadius: BorderRadius.circular(9)
                           ),

                           child: Text(title[index],style: TextStyle(fontWeight: FontWeight.bold)),
                         ),
                          Container(
                           alignment: Alignment.center,
                            height: Get.height*0.04,
                            width: Get.width*0.30,
                            decoration: BoxDecoration(
                                color: Appcolors.green,
                                borderRadius: BorderRadius.circular(9)
                            ),
                           child: Text(Subtitle[index],),
                         ),
                             ],
                           ),
                         Spacer(),
                         Container(
                           alignment: Alignment.center,
                           height: Get.height*0.04,
                           width: Get.width*0.25,
                           decoration: BoxDecoration(
                               color: Appcolors.green,
                               borderRadius: BorderRadius.circular(9)
                           ),
                           child: Text(price[index]),
                         ),
                       ]),
                      ),
                    );
                  }))
            ],
          ),
        ),
      ),
      ShowBottomNavigationbar: true
    );
  }
}

class fooditem{
  String image;
  String title;
  String subtitle;
  double rating;
  double price;

  fooditem({
    required   this.image,
    required  this.title,
    required  this.subtitle,
    required  this.price,
    required this.rating,
  });
}