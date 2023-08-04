import 'package:flutter/material.dart';
import 'package:getx_skeleton/app/data/models/product.dart';

import '../../../../components/price_view.dart';

class ProductView extends StatelessWidget {
  final Product product;
  const ProductView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    TextStyle titleTextStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );

    Widget imageView = Container(
      color: Colors.white,
      height: 112,
      child:  Image.network(product.images!.first),
    );

    Widget categoryView = Row(
      children: [
        const Icon(
          Icons.category,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text(
          product.category ?? "-",
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );

    String title = product.title ?? "-";

    Widget bodyView = Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 128,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: titleTextStyle),
          const SizedBox(height: 8),
          PriceView(
            price: product.price ?? 0,
            discount: product.discountPercentage ?? 0,
          ),
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
