import 'dart:html';
import 'package:flutter/material.dart';
// import 'package:new_shop/widgets/product_item.dart';
import 'package:new_shop/providers/product.dart';
import 'package:new_shop/screens/cart_screen.dart';
import 'package:new_shop/widgets/products_grid.dart';
import 'package:new_shop/providers/products.dart';
import 'package:provider/provider.dart';
import 'package:new_shop/widgets/badge.dart';
import 'package:provider/provider.dart';
import 'package:new_shop/providers/cart.dart';

enum FilterOptions{
  Favorites, 
  All
}

class ProductsOverviewScreens extends StatefulWidget {
  
  
  @override
  State<ProductsOverviewScreens> createState() => _ProductsOverviewScreensState();
}

class _ProductsOverviewScreensState extends State<ProductsOverviewScreens> {
  var  _showOnlyFavorites = false;  
  // Friendly note : We should place the show fav var here and not in the products.dart provider 
  // because we only display the items in this widget only, if we change the list of items by placing 
  // the show fav var in the providers file, it will affect the global datas.  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Enhanced shopping app"),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) { 
                setState(() {
                  if(selectedValue == FilterOptions.Favorites){
                    _showOnlyFavorites = true; 
                  }
                  else{
                    _showOnlyFavorites = false; 
                  }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            // itemBuilder buils the entries for the menu
            itemBuilder: (_) => [
              PopupMenuItem(child:  Text('Only favourites'), value: FilterOptions.Favorites,),
              PopupMenuItem(child:  Text('Show all'), value: FilterOptions.All,), 
            ],
          ),
          
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge( // Return the badge
              child: ch, // ch is the IconButton.
              value: cart.itemCount.toString(),
            ),  
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart, 
              ),
              onPressed: (){ // Navigate to the cart screen
                Navigator.of(context).pushNamed(
                CartScreen.routeName,
                //arguments: product.id,
            );
                
              },
            ), 
          )
          
        ],
      ),

      body: ProductsGrid(_showOnlyFavorites),
      
    );
  }
}

