import 'package:flutter/material.dart';

class AppSearchTextField extends StatelessWidget {
  const AppSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 10,
        )
      ],
    );

    InputDecoration inputDecoration = const InputDecoration(
      hintText: "Type Search Here",
      errorBorder: InputBorder.none,
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
    );

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: boxDecoration,
      height: 56,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: TextFormField(decoration: inputDecoration)),
          const Icon(Icons.search)
        ],
      ),
    );
  }
}
