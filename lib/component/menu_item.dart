import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final IconData iconName;
  final String name;
  const MenuItem({super.key, required this.iconName, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60,
          height: 60,
          child: Center(
            child: Icon(
              iconName,
              size: 35,
              color: Colors.white,
            ),
          ),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Color(0xFFfd9501)),
        ),
        SizedBox(
          height: 15,
        ),
        Text(name, style: TextStyle(fontSize: 14))
      ],
    );
  }
}
