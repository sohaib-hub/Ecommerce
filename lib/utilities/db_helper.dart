import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'cart_provider/cart_provider.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'cart_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE cart_items (
            id INTEGER PRIMARY KEY,
            title TEXT,
            image TEXT,
            price REAL,
            quantity INTEGER
          )
        ''');
      },
    );
  }

  Future<int> insertCartItem(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('cart_items', row);
  }
  Future<int> insertCartItem1(Map<String, dynamic> row) async {
    Database db = await instance.database;

    // Check if the item already exists in the database
    List<Map<String, dynamic>> existingItems = await db.query(
      'cart_items',
      where: 'id = ? AND image= ?', // Replace with your actual conditions
      whereArgs: [row['id'], row['image']], // Replace with your actual values
    );

    if (existingItems.isNotEmpty) {
      // Item already exists, return an error code or handle it as needed
      print('error');
      print('Item already exists, return an error code or handle it as needed');
      return -1;
    }

    // Item doesn't exist, proceed with the insertion
    return await db.insert('cart_items', row);
  }


  Future<List<CartItem>> queryAllCartItems() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result = await db.query('cart_items');
    return result.map((map) => CartItem.fromMap(map)).toList();
  }
  //removal
  /*Future<int> deleteCartItem(int id) async {
    Database db = await instance.database;
    return await db.delete('cart_items', where: 'id = ?', whereArgs: [id]);
  }*/

  Future<int> deleteCartItem(int productIndex) async {
    Database db = await instance.database;

    // Get the cart item at the given index
    List<Map<String, dynamic>> cartItems = await db.query('cart_items');
    if (productIndex < 0 || productIndex >= cartItems.length) {
      // Invalid index, handle error or return 0
      return 0;
    }

    int cartItemId = cartItems[productIndex]['id'];

    // Delete the cart item with the obtained ID
    return await db.delete('cart_items', where: 'id = ?', whereArgs: [cartItemId]);
  }

  Future<int> clearCart() async {
    Database db = await database;
    return await db.delete('cart_items');
  }
  Future<int> increaseCartItemQuantity(int id) async {
    Database db = await instance.database;
    return await db.rawUpdate('''
      UPDATE cart_items
      SET quantity = quantity + 1
      WHERE id = ?
    ''', [id]);
  }

  Future<int> decreaseCartItemQuantity(int id) async {
    Database db = await instance.database;
    return await db.rawUpdate('''
      UPDATE cart_items
      SET quantity = quantity - 1
      WHERE id = ? AND quantity > 0
    ''', [id]);
  }
  Future<double> calculateTotalPrice() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> cartItems = await db.query('cart_items');
    double totalPrice = 0.0;
    for (var cartItem in cartItems) {
      double price = cartItem['price'];
      int quantity = cartItem['quantity'];

      totalPrice += (price * quantity);
    }

    return totalPrice;
  }

// ... existing code ...

}
