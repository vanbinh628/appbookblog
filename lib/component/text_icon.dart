import 'package:flutter/material.dart';

class TextIcon extends StatelessWidget {
  final String valueText;
  const TextIcon({super.key, required this.valueText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(valueText, style: TextStyle(fontSize: 14)),
        Icon(Icons.navigate_next, size: 30, color: Colors.grey,)
      ],
    );
  }
}