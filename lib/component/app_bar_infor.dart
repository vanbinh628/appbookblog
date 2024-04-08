import 'package:flutter/material.dart';
class AppBarInformation extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const AppBarInformation({
    super.key, 
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: Color(0xFFfd9501),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {

            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: const Icon(Icons.edit_note_sharp, size: 35, color: Colors.white)
            )),
        ],
      ),
    );
  }
}