import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/orders.dart';
import 'views/orderd_sreen.dart';
import 'views/cart_screen.dart';
import 'providers/cart.dart';
import 'providers/products.dart';
import 'views/product_detal_screen.dart';
import 'utils/app_routes.dart';
import 'views/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'Minha Loja',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {

          AppRoutes.PRODUCT_DETAIL: (_) => ProductDetailScreen(),
          AppRoutes.CART: (_) => CartScreen(),
          AppRoutes.ORDERS: (_) => OrdersScreen(),
        },
      ),
    );
  }
}
