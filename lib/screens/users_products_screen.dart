import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/screens/edit_product_screen.dart';
import 'package:shop_app/widgets/my_drawer.dart';
import 'package:shop_app/widgets/users_product_item.dart';

class UsersProductsScreen extends StatelessWidget {
  static const routeName = '/users-products';
  const UsersProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
              tooltip: 'Add Product',
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: ListView.builder(
            itemCount: productsProvider.items.length,
            itemBuilder: (context, index) {
              return UsersProductItems(
                  title: productsProvider.items[index].title,
                  imageUrl: productsProvider.items[index].imageUrl);
            }),
      ),
    );
  }
}
