import 'package:flutter/material.dart';
import 'package:new_shop/providers/product.dart';
import 'package:new_shop/widgets/product_item.dart';
import 'package:provider/provider.dart';
import 'package:new_shop/providers/products.dart';

class ProductsGrid extends StatelessWidget {
  final bool showVals; 
  ProductsGrid(this.showVals); 

  @override
  Widget build(BuildContext context) {
    // productsData access to the object of the Products class
    final productsData = Provider.of<Products>(context); // Establish communication with the provider of the Products class
    final products = showVals == true ? productsData.favoriteItems : productsData.items ; // the list of products
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (ctx,i) => ChangeNotifierProvider.value(
        // create:  (c) => products[i],
        value : products[i],
        child: ProductItem( 
          // id: products[i].id ,
          // title: products[i].title, 
          // imageUrl: products[i].imageUrl,
        ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, 
        childAspectRatio: 0.75, 
        mainAxisSpacing: 10, 
        crossAxisSpacing: 10
      ),
    );
  }
}