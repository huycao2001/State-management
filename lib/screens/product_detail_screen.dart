import 'package:flutter/material.dart';
import 'package:new_shop/providers/product.dart';
import 'package:new_shop/widgets/product_item.dart';
import 'package:new_shop/providers/products.dart';
import 'package:provider/provider.dart';


class ProductDetailScreen extends StatelessWidget {
  //const ProductDetailScreen({ Key? key }) : super//(key: key);
  // String title; 
  // double price; 
  // ProductDetailScreen(this.title , this.price);
  static const routeName = '/product-detail'; 

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String; // this is a passing argument from product_item.dart
    // Ref : https://api.flutter.dev/flutter/dart-core/Iterable/firstWhere.html
    // This is the listener widget
    final loadedProduct = Provider.of<Products>(context).findById(productId); // Get the procut base on the product Id argument
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}