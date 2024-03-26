import 'package:appbookblog/component/menu_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 220,
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
              ),
              Container(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                width: double.infinity,
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: index < 7
                            ? const EdgeInsets.only(right: 12)
                            : const EdgeInsets.only(left: 0),
                        child: MenuItem(name: 'Book', iconName: 'iconName'),
                      );
                    }),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
