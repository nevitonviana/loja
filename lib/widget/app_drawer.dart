import 'package:flutter/material.dart';

import '/utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("Bem Vindo Usuario"),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop_rounded),
            title: Text("Loja"),
            onTap: () => Navigator.of(context)
                .pushNamedAndRemoveUntil(AppRoutes.HOME, (route) => false),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment_outlined),
            title: Text("Loja"),
            onTap: () => Navigator.of(context)
                .pushNamedAndRemoveUntil(AppRoutes.ORDERS, (route) => false),
          ),
        ],
      ),
    );
  }
}
