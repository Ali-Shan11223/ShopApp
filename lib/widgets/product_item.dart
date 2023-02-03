import 'dart:ffi';

import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  const ProductItem(
      {super.key,
      required this.id,
      required this.title,
      required this.imageUrl,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        leading: Icon(Icons.favorite),
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        trailing: Icon(Icons.shopping_cart),
      ),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
