import 'package:appbookblog/component/adv_poster.dart';
import 'package:appbookblog/component/menu_item.dart';
import 'package:appbookblog/component/text_icon.dart';
import 'package:appbookblog/model/menu_icon.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<MenuIcon> menuIcon;
  int indexAdvSelect = 0;

  @override
  void initState() {
    super.initState();
    menuIcon = [
      MenuIcon(name: 'airline', iconName: Icons.airline_seat_flat_angled_rounded),
      MenuIcon(name: 'time', iconName: Icons.access_time_filled_rounded),
      MenuIcon(name: 'airline', iconName: Icons.local_grocery_store_sharp),
      MenuIcon(name: 'airline', iconName: Icons.airline_seat_flat_angled_rounded),
      MenuIcon(name: 'time', iconName: Icons.access_time_filled_rounded),
      MenuIcon(name: 'airline', iconName: Icons.local_grocery_store_sharp),
      MenuIcon(name: 'airline', iconName: Icons.airline_seat_flat_angled_rounded),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    menuIcon.clear();
  }

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
                height: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/mother_nature.jpg'), fit: BoxFit.fitHeight, alignment: Alignment.bottomCenter),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 25, bottom: 15),
                width: double.infinity,
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: menuIcon.length,
                    itemBuilder: (BuildContext context, index) {
                      MenuIcon  item = menuIcon[index];
                      return Padding(
                        padding: index < menuIcon.length - 1
                            ? const EdgeInsets.only(right: 12)
                            : const EdgeInsets.only(right: 0),
                        child: MenuItem(name: item.name, iconName: item.iconName),
                      );
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Một phút quảng cáo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                    TextIcon(valueText: 'Tất cả cả'),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                        padding: index < 2
                            ? const EdgeInsets.only(right: 12)
                            : const EdgeInsets.only(left: 0),
                        child: Row(
                          children: [
                            AdvPoster(isSelect: index == indexAdvSelect, onTap: () { 
                              setState(() {
                                indexAdvSelect = index;
                              });
                             },),
                          ],
                        )
                    );
                  }
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
