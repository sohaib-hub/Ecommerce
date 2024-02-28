
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../db_helper.dart';

class CartItem{
  String title;
  String image='';
  double price;
  int quantity;
  CartItem({
    required this.image, required this.title,required this.price,required this.quantity
});
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image,
      'price': price,
      'quantity': quantity,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      title: map['title'],
      image: map['image'],
      price: map['price'],
      quantity: map['quantity'],
    );
  }

}

class CartController extends GetxController {
  //List<CartItem> cartItems = [];

  DatabaseHelper dbHelper = DatabaseHelper.instance;

  void addToCart(CartItem item) async{
  //  cartItems.add(item);
    update(); // Notify listeners
    await dbHelper.insertCartItem(item.toMap());
  }
}
