import 'package:flutter/material.dart';

class SectionDivider extends StatelessWidget {
  final EdgeInsets padding;
  final String title;
  const SectionDivider({super.key, required this.padding, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(width: 12),        
          const Expanded(
              child: Divider(
              height: 2,
              color: Colors.grey,
          ))
        ],
      ),
    );
  }
}
