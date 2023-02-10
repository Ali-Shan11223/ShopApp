import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/providers/orders_provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/edit_product_screen.dart';
import 'package:shop_app/screens/orders_screen.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/product_overview_screen.dart';
import 'package:shop_app/screens/users_products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ProductsProvider(),
          ),
          ChangeNotifierProvider(create: (context) => CartProvider()),
          ChangeNotifierProvider(create: (context) => OrderProvider())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.teal,
            fontFamily: 'Lato',
            appBarTheme: const AppBarTheme(
                color: Colors.teal, titleTextStyle: TextStyle(fontSize: 20)),
          ),
          home: const ProductOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (context) =>
                const ProductDetailScreen(),
            CartScreen.routeName: (context) => const CartScreen(),
            OrdersScreen.routeName: (context) => const OrdersScreen(),
            UsersProductsScreen.routeName: (context) =>
                const UsersProductsScreen(),
            EditProductScreen.routeName: (context) => const EditProductScreen()
          },
        ));
  }
}
