import 'package:ecommerce/resources/app_images/appimages.dart';
import 'package:ecommerce/utilities/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:ecommerce/utilities/custom_scaffold/custom_scaffold.dart';
import 'package:ecommerce/view/product_detail_view/product_detail_view.dart';
import 'package:ecommerce/viewmodel/homeview_model/homeview_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/AppIcons/appicons.dart';
import '../../resources/appcolors/app_colors.dart';
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeviewModel _homeviewModel=HomeviewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   _homeviewModel.onInit();
  }

  Widget build(BuildContext context) {

    return CustomScaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: Get.width,
              height: Get.height*0.08,
              color: Appcolors.green,
              // alignment: Alignment.center,
              child: Container(
                height: Get.height*0.08,
                width: Get.width,
                color: Appcolors.whiteA700,
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: Get.height*0.08,
                        width: Get.width*0.8,
                        //width: MediaQuery.of(context).size.width*0.7,
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(AppIcons.search),
                            hintText: 'search',

                          ),
                          onChanged: (value){
                            setState(() {
                              _homeviewModel.searchtext=value;
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
            Expanded(
                child: GridView.count(crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                  children:
                    _homeviewModel.items.where((itemdetail) =>itemdetail.title.toLowerCase().contains(_homeviewModel.searchtext.toLowerCase())).map((itemdetail){
                      return buildcard(itemdetail);}).toList(),

                )
            )
          ],
        ),
      ),
      ShowBottomNavigationbar: true,

    );

  }
}
Widget buildcard(itemdetail _itemdetail){
  return
      GestureDetector(
        onTap: (){

          Get.to(ProductDetailView(
              image:_itemdetail.image,
              title:_itemdetail.title,
              price:_itemdetail.price));
        },
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: _itemdetail.image.length,
                    onPageChanged:
                        (int index){
                 _itemdetail.currentindex= index;
                    },
                    itemBuilder:(context, index){
                  return Image.asset(_itemdetail.image,fit: BoxFit.fill,);
                
                }),
              ),
              ListTile(
                title: Text(_itemdetail.title,style: TextStyle(fontSize: 12),),
                subtitle: Text("\$${_itemdetail.price}",style: TextStyle(fontSize: 10,color: Appcolors.gray),),

              )

            ],
          ),
        ),
      );
}
/*class itemdetail{
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
}*/