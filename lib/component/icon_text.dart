import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData iconName;
  final String valueText;
  final Color color;
  const IconText(
      {super.key,
      required this.iconName,
      required this.valueText,
      this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(iconName, size: 25, color: color),
        const SizedBox(width: 12),
        Text(valueText, style: TextStyle(fontSize: 15, color: color)),
      ],
    );
  }
}
