import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/providers/orders_provider.dart';

class ItemOrder extends StatefulWidget {
  final OrderItem orderItem;
  const ItemOrder({super.key, required this.orderItem});

  @override
  State<ItemOrder> createState() => _ItemOrderState();
}

class _ItemOrderState extends State<ItemOrder> {
  var _expandable = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${widget.orderItem.amount.toStringAsFixed(2)}'),
            subtitle: Text(DateFormat('dd/MM/yyyy hh:mm')
                .format(widget.orderItem.dateTime)),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    _expandable = !_expandable;
                  });
                },
                icon:
                    Icon(_expandable ? Icons.expand_less : Icons.expand_more)),
          ),
          if (_expandable)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: min(widget.orderItem.products.length * 20.0 + 14, 180),
              child: ListView(
                children: widget.orderItem.products
                    .map((prod) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              prod.title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${prod.quantity}x \$${prod.price}',
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.grey),
                            )
                          ],
                        ))
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
