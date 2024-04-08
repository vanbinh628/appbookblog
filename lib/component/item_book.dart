import 'package:flutter/material.dart';

class ItemBook extends StatelessWidget {
  const ItemBook(
      {super.key,
      required this.title,
      required this.description,
      required this.onChangeValue,
      required this.value});
  final String title;
  final String description;
  final bool value;
  final Function(bool? value) onChangeValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 3,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset('assets/animal.jpg'))),
          const SizedBox(width: 5),
          Expanded(
              flex: 6,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(description, style: TextStyle(fontSize: 16), overflow: TextOverflow.ellipsis, maxLines: 3,),
                ],
              )),
          Expanded(
            flex: 1,
            child: Checkbox(
              onChanged: onChangeValue,
              value: value,
              side: BorderSide(width: 1),
              activeColor: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
