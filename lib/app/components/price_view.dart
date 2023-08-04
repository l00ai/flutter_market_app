import 'package:flutter/material.dart';

class PriceView extends StatelessWidget {
  final num price;
  final num discount;
  const PriceView({super.key, required this.price, required this.discount});

  @override
  Widget build(BuildContext context) {
    TextStyle priceTextStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );

    TextStyle oldPriceTextStyle = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.grey,
      decorationColor: Colors.grey,
      decoration: TextDecoration.lineThrough,
      decorationThickness: 1.5,
    );

    TextStyle offerTextStyle = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w800,
      color: Colors.green,
    );

    return Row(
      children: [
        Text("$price\$", style: priceTextStyle),
        const SizedBox(width: 5),
        Text("2400\$", style: oldPriceTextStyle),
        const SizedBox(width: 5),
        Text("$discount% Off", style: offerTextStyle),
      ],
    );
  }
}
