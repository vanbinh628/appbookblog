import 'package:appbookblog/screen/home.dart';
import 'package:appbookblog/screen/information.dart';
import 'package:appbookblog/screen/list_book_screen.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBar();
}

class _BottomBar extends State<BottomBar> {

  late int indexScreen;

  @override
  void initState() {
    super.initState();
    indexScreen = 2;
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ListBookScreen(),
    InformationScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Center(
              child: _widgetOptions.elementAt(indexScreen),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book),
                  label: 'Books',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school),
                  label: 'School',
                ),
              ],
              currentIndex: indexScreen,
              selectedItemColor: Color(0xFFfd9501),
              onTap: (index) {
                setState(() {
                  indexScreen = index;
                });
              },
            ),
          );
  }
}