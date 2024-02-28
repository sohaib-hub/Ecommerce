
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../resources/AppIcons/appicons.dart';
import '../../resources/app_animations/app_anim.dart';
import '../../resources/appcolors/app_colors.dart';
import '../../utilities/cart_provider/cart_provider.dart';
import '../../utilities/db_helper.dart';

class MycartviewModel extends GetxController{
  double totalprice=0.0;
  late BuildContext context; // Add a context field

  void setContext(BuildContext ctx) {
    context = ctx;
  }

  void checkout(){
    showDialog(context: context,
        builder: (context ){
          return AlertDialog(
            title: Text('Checkout'),
            content: Text('You buy these things'),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Appcolors.green),
                  onPressed: (){

                    Navigator.pop(context);
                  }, child:Text('ok',style: TextStyle(color: Appcolors.whiteA700),))
            ],
          );
        });}

  /*Widget Itemlist(){
   return  Obx(() =>
     FutureBuilder<List<CartItem>>(
     future: DatabaseHelper.instance.queryAllCartItems(),
     builder: (context, snapshot) {
       if (snapshot.connectionState == ConnectionState.waiting) {
         return Center(
           child: SizedBox(
               height: 100,
               width: 100,
               child: Lottie.asset(Appanimation.loading_anim,height: Get.height*0.6,width:Get.width*0.9,fit: BoxFit.fill,)),
         ); // Or any loading indicator
       } else if (snapshot.hasError) {
         return Text('Error: ${snapshot.error}');
       } else {
         List<CartItem> cartItems = snapshot.data ?? [];
         return Expanded(
           child: ListView.builder(
             itemCount: cartItems.length,
             itemBuilder: (context, index) {
               CartItem item = cartItems[index];
               return Dismissible(
                 key: Key(item.toString()),
                 direction: DismissDirection.startToEnd,
                 onDismissed:
                     (value) async {
                   // Remove from SQLite database
                   // await DatabaseHelper.instance.deleteCartItem(index);
                   await DatabaseHelper.instance.deleteCartItem(index);
                   print('item');
                   //print(controller.cartItems.length);
                 },
                 background: Container(
                   alignment: Alignment.centerLeft,
                   color: Appcolors.red,
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Icon(AppIcons.cancel, color: Appcolors.whiteA700),
                   ),
                 ),
                 child: Row(
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Container(
                         alignment: Alignment.bottomLeft,
                         height: Get.height * 0.099,
                         width: Get.width * 0.28,
                         decoration: BoxDecoration(
                           color: Appcolors.whiteA700,
                           image: DecorationImage(
                             image: AssetImage(item.image),
                             fit: BoxFit.cover,
                           ),
                         ),
                       ),
                     ),
                     SizedBox(width: 8),
                     Column(
                       children: [
                         Text(item.title),
                         //  Text('\$${price=item.price}', style: TextStyle(color: Appcolors.gray)),
                         Text('\$${item.price}', style: TextStyle(color: Appcolors.gray)),
                       ],
                     ),
                     Spacer(),
                     Row(
                       children: [
                         ///decrement
                         IconButton(
                           onPressed: () async {
                             // Decrease quantity in SQLite database

                             if (item.quantity > 0) {
                               // await DatabaseHelper.instance.updateCartItem(item.copyWith(quantity: item.quantity - 1));
                               // await DatabaseHelper.instance.decreaseCartItemQuantity(index+1);
                               var updatedRows = await DatabaseHelper.instance.decreaseCartItemQuantity(index + 1);
                             totalprice=(await DatabaseHelper.instance.calculateTotalPrice()) ;
                             }

                           //  setState((){

                               //  item.quantity--;
                          //   });

                           },
                           icon: Icon(AppIcons.remove),
                         ),

                         Text("${item.quantity}"),
                         ///increment
                         IconButton(
                           onPressed: ()async{
                             // Increase quantity in SQLite database
                             //await DatabaseHelper.instance.updateCartItem(item.copyWith(quantity: item.quantity + 1));

                             int updatedRows=await DatabaseHelper.instance.increaseCartItemQuantity(index+1);
                             totalprice=(await DatabaseHelper.instance.calculateTotalPrice());
                             print("increase: Updated Rows:$updatedRows");
                            // setState(() {});
                           },
                           icon: Icon(AppIcons.add),
                         ),
                       ],
                     )
                   ],
                 ),
               );
             },
           ),
         );
       }
     },
   ));
  }*/
}