import 'package:flutter/material.dart';

/// [isLong] detail is very lengthy [isLong] = true
class ItemInfor extends StatelessWidget {
  final bool isLong;
  final String title;
  final String detail;
  const ItemInfor(
      {super.key,
      this.isLong = false,
      required this.title,
      required this.detail});

  @override
  Widget build(BuildContext context) {
    if (!isLong) {
      return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            children: [
              Text('${title} : ',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              Text(detail, style: const TextStyle(fontSize: 14)),
            ],
          ));
    }
    return Padding(
        padding: const EdgeInsets.only(bottom: 16), 
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${title} : ', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              Text(detail, style: const TextStyle(fontSize: 14)),
            ],
          ),
        )
      );
  }
}
