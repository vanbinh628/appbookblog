import 'package:flutter/material.dart';

class AdvPoster extends StatelessWidget {
  final bool isSelect;
  final Function() onTap;
  const AdvPoster({super.key, required this.isSelect, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: isSelect ? 360 : 288,
        height: isSelect ? 180 : 144,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/image_poster.png'), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(30)
        ),
      ),
    );
  }
}