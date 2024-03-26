import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String name;
  final String iconName;
  const MenuItem({super.key, required this.name, required this.iconName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          child: Center(
            child: Icon(
              Icons.access_alarm,
              size: 30,
              color: Colors.white,
            ),
          ),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.red),
        ),
        SizedBox(
          height: 15,
        ),
        Text(name, style: TextStyle(fontSize: 14))
      ],
    );
  }
}
