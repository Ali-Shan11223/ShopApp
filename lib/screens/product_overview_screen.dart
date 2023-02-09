import 'package:flutter/material.dart';
import '../widgets/products_grid.dart';

enum FilterOptions { favoritesOnly, all }

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({
    super.key,
  });

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
               setState(() {
                  if (selectedValue == FilterOptions.favoritesOnly) {
                  showOnlyFavorites = true;
                } else {
                  showOnlyFavorites = false;
                }
               });
              },
              tooltip: 'More',
              icon: const Icon(Icons.more_vert),
              itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: FilterOptions.favoritesOnly,
                      child: Text('Only Favorites'),
                    ),
                    const PopupMenuItem(
                      value: FilterOptions.all,
                      child: Text('Show All'),
                    )
                  ])
        ],
      ),
      body: ProductsGrid(showFavs: showOnlyFavorites,),
    );
  }
}
