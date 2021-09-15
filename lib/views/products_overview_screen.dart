import 'package:flutter/material.dart';
import 'package:loga/widget/app_drawer.dart';
import 'package:provider/provider.dart';

import '/providers/cart.dart';
import '/utils/app_routes.dart';
import '/widget/badge.dart';
import '/providers/products.dart';
import '/widget/product_grid.dart';

enum FilterOptions {
  Favorite,
  all,
}

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Products products = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Loja"),
        centerTitle: true,
        actions: [
          Consumer<Cart>(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CART);
              },
              icon: Icon(
                Icons.shopping_cart_rounded,
              ),
            ),
            builder: (_, cart, child) => Badge(
              value: cart.itemCount.toString(),
              child: child!,
            ),
          ),
          PopupMenuButton(
            onSelected: (value) {
              if (value == FilterOptions.Favorite) {
                products.showFavoriteOnly();
              } else {
                products.showAll();
              }
            },
            icon: Icon(Icons.more_vert_rounded),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Somente Favoritos"),
                value: FilterOptions.Favorite,
              ),
              PopupMenuItem(
                child: Text("Todos"),
                value: FilterOptions.all,
              ),
            ],
          ),
        ],
      ),
      body: ProductGrid(),
      drawer: AppDrawer(),
    );
  }
}
