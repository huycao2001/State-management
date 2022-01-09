import 'package:flutter/material.dart';
import 'package:new_shop/providers/product.dart';
import 'package:new_shop/widgets/products_grid.dart';
import 'package:new_shop/providers/products.dart';
import 'package:provider/provider.dart';
import 'package:new_shop/widgets/badge.dart';
import 'package:provider/provider.dart';
import 'package:new_shop/providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;  
  final int quantity; 
  final String title;
  final String imageUrl; 
  CartItem(this.id, this.productId, this.price, this.quantity, this.title, this.imageUrl); 
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context,listen: false);  // Access to the cart container. 
    return Dismissible(
      key : ValueKey(id),  // The key value of the item. 
      direction: DismissDirection.endToStart,
      background: Container(
        color : Colors.red, 
        child: Icon(Icons.delete, color : Colors.white),
        alignment: Alignment.centerRight,
        padding : EdgeInsets.only(right : 20), 
        margin :  EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      onDismissed:(direction){
        Provider.of<Cart>(context, listen : false).removeItem(productId); 
      } ,

      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child : Padding(
          padding: EdgeInsets.all(8),
          child : ListTile(
            leading: FittedBox(
              //width 
              fit : BoxFit.contain,
              child: Image.network(imageUrl)
            ),
            title : Text(title),
            subtitle: Text('Total : ' + (price*quantity).toString()),
            trailing: Wrap(
              children: [
                IconButton(
                  icon : Icon(Icons.remove),
                  onPressed: (){cart.decreaseItem(productId);},
                ),
                Padding(
                  child: Text('Quantity : $quantity x', style: TextStyle(fontWeight: FontWeight.bold),),
                  padding: EdgeInsets.all(10),
                ),
                IconButton(
                  icon : Icon(Icons.add),
                  onPressed: (){cart.addItem(productId, price, title);},
                ),
              ],
            ),
          )
        )
      ),
    );
  }
}
