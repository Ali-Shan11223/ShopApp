import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/widgets/my_drawer.dart';

class UsersProductsScreen extends StatelessWidget {
  static const routeName = '/users-products';
  const UsersProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: productsProvider.items.length,
            itemBuilder: (context, index) {
              return Container();
            }),
      ),
    );
  }
}
