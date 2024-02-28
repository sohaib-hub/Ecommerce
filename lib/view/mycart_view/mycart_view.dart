import 'package:ecommerce/resources/app_animations/app_anim.dart';
import 'package:ecommerce/utilities/cart_provider/cart_provider.dart';
import 'package:ecommerce/utilities/custom_scaffold/custom_scaffold.dart';
import 'package:ecommerce/utilities/db_helper.dart';
import 'package:ecommerce/viewmodel/mycart_view_model/mycart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../resources/AppIcons/appicons.dart';
import '../../resources/appcolors/app_colors.dart';
import 'package:lottie/lottie.dart';

class MycartView extends StatefulWidget {
  const MycartView({super.key});

  @override
  State<MycartView> createState() => _MycartViewState();
}

class _MycartViewState extends State<MycartView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
 CartController controller=CartController();
  final cartmodel=Get.put(MycartviewModel());
  @override
  Widget build(BuildContext context) {
    cartmodel.setContext(context);
    return   CustomScaffold(
        body:SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Cart',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              ),
              Divider(),
              //cartmodel.Itemlist(),
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
                                          cartmodel.totalprice=(await DatabaseHelper.instance.calculateTotalPrice()) ;
                                        }

                                        setState((){

                                          //  item.quantity--;
                                        });

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
                                        cartmodel.totalprice=(await DatabaseHelper.instance.calculateTotalPrice());
                                        setState(() {});
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
              ),
              Divider(),

              Row(
                children: [
                 const Text('Total Price:',style: TextStyle(fontSize: 22,),),
                 Text("${cartmodel.totalprice}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                ],
              ),
              Center(
                child: ElevatedButton(onPressed: (){
                  cartmodel.checkout();
                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Appcolors.green,
                    ),
                    child:  Text('Proceed to Checkout',style: TextStyle(color: Appcolors.whiteA700),)
                ),
              )
            ],
          ),
        ),
        ShowBottomNavigationbar: true
    );

  }
}

