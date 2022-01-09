import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    // If we set listen = true then the whole widget tree will be rebuilt
    final product = Provider.of<Product>(context, listen: false); // Connect to the product object
    final cart = Provider.of<Cart>(context,listen: false);  // Access to the cart container. 

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          // leading: Consumer<Product>( // Only the icon changes
          //   builder: (ctx, product, child) => IconButton( // Return the icon button
          //         icon: Icon(
          //           product.isFavorite ? Icons.favorite : Icons.favorite_border,
          //         ),
          //         color: Theme.of(context).accentColor,
          //         onPressed: () {
          //           product.toggleFavoriteStatus(); // Like or dislike the product
          //         },
          //   ),
          // ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: Consumer<Cart>(
            builder: (ctx, cart, child) =>IconButton(
            icon: Icon(
              cart.productExist(product.id) ? Icons.check : Icons.add,
            ),
            onPressed: () {
              cart.addItem(product.id, product.price, product.title); // Add the item to card
            },
            color: Theme.of(context).accentColor,
          ), 
          )
        ),
      ),
    );
  }
}


