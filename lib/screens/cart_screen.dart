import 'package:flutter/material.dart';
import 'package:new_shop/providers/product.dart';
import 'package:new_shop/widgets/products_grid.dart';
import 'package:new_shop/providers/products.dart';
import 'package:provider/provider.dart';
import 'package:new_shop/widgets/badge.dart';
import 'package:provider/provider.dart';
import 'package:new_shop/providers/cart.dart';
import 'package:new_shop/widgets/cart_item.dart' as ci;

class CartScreen extends StatelessWidget {
  // const CartScreen({ Key? key }) : super(key: key);
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context); 
    final product = Provider.of<Products>(context); 
    return Scaffold(
      appBar: AppBar(
        title:  Text('My Cart'),
      ),

      body : Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: TextStyle(fontSize: 20),), 
                  Spacer(),
                  Chip(
                    label: Text('\$${cart.totalAmount}', style : TextStyle(color: Colors.white)), 
                    backgroundColor: Theme.of(context).primaryColor,
                  ), 
                  FlatButton(
                    child: Text('ORDER NOW',),
                    onPressed: (){},
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ), 
          SizedBox(height : 10),
          
          Expanded(
            child : ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => ci.CartItem(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],  // Id of the product
                cart.items.values.toList()[i].price, 
                cart.items.values.toList()[i].quantity, 
                cart.items.values.toList()[i].title,
                product.ImageById(cart.items.keys.toList()[i])
              ),
            )
          )    
        ],
      ), 
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        label : Text('\$${cart.totalAmount}', style: TextStyle(color: Colors.white),)
      )
    );
  }
}