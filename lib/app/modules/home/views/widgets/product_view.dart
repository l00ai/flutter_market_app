import 'package:flutter/material.dart';

import '../../../../components/price_view.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle titleTextStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );

    Widget imageView = Container(
      color: Colors.white,
      height: 112,
      child: const Icon(Icons.ac_unit_sharp, size: 64),
    );

    Widget categoryView = const Row(
      children: [
        Icon(
          Icons.category,
          size: 16,
        ),
        SizedBox(width: 4),
        Text(
          "Exchange",
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );

    String title = "Apple MacBook Pro Core I9 9th Generation";

    Widget bodyView = Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 128,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: titleTextStyle),
          const SizedBox(height: 8),
          const PriceView(),
          const SizedBox(height: 8),
          categoryView
        ],
      ),
    );

    return Container(
      color: Colors.white,
      child: Column(
        children: [imageView, bodyView],
      ),
    );
  }
}
