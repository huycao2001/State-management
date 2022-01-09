import 'package:flutter/material.dart';
import './product.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class CartItem{
  final String id; 
  final String title;
  int quantity = 0; 
  final double price; 
  CartItem(
    {this.id, // this id is different from the id of the product object.
    this.title,
    this.quantity,
    this.price}
  ); 
}

class Cart with ChangeNotifier{
  Map<String, CartItem> _items = {}; // Map between the product ID and the respective cart item. 

  Map<String, CartItem> get items{
    return {..._items}; 
  }

  int get itemCount{
    return _items.length;
  }

  double get totalAmount{
    var total = 0.0;
    _items.forEach((key, cartItem) { 
      total += cartItem.price * cartItem.quantity;
    }
    ); 
    return  total;
  }

  void addItem(String productId, double price, String title){
    if(_items.containsKey(productId)){
      // Item already exist then we increte the quantity
      _items.update( 
        productId, 
        (existingCartItem) => CartItem( // Existing item is the item that we want to update. 
          id : existingCartItem.id, 
          title: existingCartItem.title, 
          price: existingCartItem.price, 
          quantity: existingCartItem.quantity + 1
        )
      );
    }
    else{
      // Add a new item to cart
      _items.putIfAbsent(productId, () => CartItem(
        id : DateTime.now().toString() , 
        title : title, 
        price : price,
        quantity: 1
      )); 
    }
    notifyListeners();
  }

  void removeItem(String productId ){
    _items.remove(productId); 
    notifyListeners(); 
  }

  void decreaseItem(String productId){
    _items[productId].quantity--;
     if(_items[productId].quantity == 0) removeItem(productId);
    notifyListeners(); 
  }

  bool productExist(String productId){
    //print(productId); 
    if(items[productId] == null) return false; 
    return true;  

  }


}