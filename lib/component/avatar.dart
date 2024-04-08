import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Avatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage('assets/animal.jpg'),
      maxRadius: 50,
      minRadius: 25,
    );
  }

}