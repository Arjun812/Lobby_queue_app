import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:webtest/utils/styles.dart';

import '../../widgets/bottom_bar.dart';
import '../homePage/home_page.dart';

class TabPage extends StatefulWidget {
  const TabPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TabPage> createState() => _TabPageState();
}
List<bool> selected = [true, false, false, false, false];
class _TabPageState extends State<TabPage> {

  List<IconData> icon = [
    Feather.list,
    Feather.database,
    Feather.clipboard,
    Feather.user,
  ];
  void select(int n) {
    for (int i = 0; i < 5; i++) {
      if (i == n) {
        selected[i] = true;
      } else {
        selected[i] = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
           Padding(padding:  const EdgeInsets.only(left: 100.0,right: 10,top: 10),
          child: HomePage()),
          Container(
            margin: const EdgeInsets.all(0.0),
            height: MediaQuery.of(context).size.height,
            width: 80.0,
            decoration: const BoxDecoration(
              color:mainColor,
              gradient: Gradients.mainGradient,
              borderRadius: BorderRadius.only(
                  topRight:Radius.circular(20),
                bottomRight: Radius.circular(20)
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 90,

                 // left: 10,
                  child: Column(
                    children: icon.map<Widget>((e) => NavBarItem(
                        icon: e,
                        selected: selected[icon.indexOf(e)],
                        onTap: () {
                          setState(() {
                            select(icon.indexOf(e));
                          });
                        },
                      ),).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}