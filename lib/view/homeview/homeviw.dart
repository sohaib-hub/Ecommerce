import 'package:ecommerce/resources/app_images/appimages.dart';
import 'package:ecommerce/utilities/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:ecommerce/utilities/custom_scaffold/custom_scaffold.dart';
import 'package:ecommerce/view/product_detail_view/product_detail_view.dart';
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
  List<itemdetail>items=[];
  String searchtext='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    items=[
      itemdetail(title:'abc jelly', image:  [AppImages.jelly,AppImages.machine,AppImages.cd], price: "\$199"),
      itemdetail(title:'Office', image: [AppImages.office] , price: "\$200"),
      itemdetail(title:'CD', image: [AppImages.cd], price: "\$150"),
      itemdetail(title:'polish', image: [AppImages.polish], price: "\$100"),
      itemdetail(title:'machine', image: [AppImages.machine], price: "\$5000"),
      itemdetail(title:'vegetable', image: [AppImages.app_logo], price: "\$160"),
      itemdetail(title:'OFF', image: [AppImages.shoping3], price: "\$160"),
      itemdetail(title:'Buy', image: [AppImages.basket], price: "\$Free"),
      itemdetail(title:'Sale', image: [AppImages.shoping1], price: "\$60% off"),
  ];}
  Widget build(BuildContext context) {
    return CustomScaffold(
      initialindex: 0,
     // appBar: AppBar(backgroundColor: Colors.transparent,
     //  leading: IconButton(onPressed: (){Navigator.pop(context);},
     //  icon: Icon(AppIcons.back_arrow),
     //
     //   ),
     //  ),
      body: SafeArea(
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
                    Container(
                      height: Get.height*0.08,
                      width: Get.width*0.8,
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(AppIcons.search),
                          hintText: 'search Restaurant & dishes'
                        ),
                        onChanged: (value){
                          setState(() {
                            searchtext=value;
                          });
                        },
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
                    items.where((itemdetail) =>itemdetail.title.toLowerCase().contains(searchtext.toLowerCase())).map((itemdetail){
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
          Get.to(ProductDetailView());
        },
        child: Card(
          child: Column(
            children: [
              SizedBox(
               // height:MediaQuery.of(context).size.height/10,
                height: Get.height/10,
                child: PageView.builder(
                  itemCount: _itemdetail.image.length,
                    onPageChanged:
                        (int index){
                 _itemdetail.currentindex= index;
                    },
                    itemBuilder:(context, index){
                  return Image.asset(_itemdetail.image[index],fit: BoxFit.fill,);

                }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children:List<Widget>.generate(_itemdetail.image.length,(int circularindex){
                    return
                        Padding(padding: EdgeInsets.all(4),
                        child: CircleAvatar(radius: 4,
                        backgroundColor:circularindex==_itemdetail.currentindex?Appcolors.blue:Appcolors.gray ,),);
                  })


                ),
              ),
              ListTile(
                title: Text(_itemdetail.title),
                subtitle: Text(_itemdetail.price),

              )

            ],
          ),
        ),
      );
}
class itemdetail{
  String title;
  String price;
  List<String> image;
  int currentindex;
  itemdetail({
  required  this.title,
    required   this.image,
    required  this.price,
    this.currentindex=0,
});
}