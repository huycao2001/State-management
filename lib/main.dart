import 'package:flutter/material.dart';
import 'package:new_shop/screens/cart_screen.dart';
import './screens/products_overview_screens.dart';
import './screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';
import './providers/cart.dart';


void main() => runApp( MyApp());

// The provider widget should be set up at the parents of the widgets that are the listeners. 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // If the data in the products changes then the listener widget will change. 
          create: (ctx) => Products(), // provider > 3 then use create , else use builder
          //value : Products(),  
        ),

        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        )
      ],
      child: MaterialApp(
        title: 'MyShop',
        debugShowCheckedModeBanner : false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.white,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreens(),
        routes:{
          ProductDetailScreen.routeName : (ctx) =>ProductDetailScreen(), // use the route name to navigate to productDetailScreen
          CartScreen.routeName : (ctx) =>CartScreen()
        }
      ),
    );
    
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MyShop'),
//       ),
//       body: Center(
//         child: Text('Let\'s build a shop!'),
//       ),
//     );
//   }
// }


