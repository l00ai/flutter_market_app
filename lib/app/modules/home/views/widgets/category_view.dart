import 'package:flutter/material.dart';
import 'package:getx_skeleton/app/components/booster.dart';

class CategoryView extends StatelessWidget {
  final String text;
  const CategoryView({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 64,
      height: 64,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Booster.textBody(text, color: Colors.white),
    );
  }
}
