import 'package:flutter/material.dart';
import 'package:flutter_clock/constants/theme_data.dart';
import 'package:flutter_clock/data.dart';
import 'package:flutter_clock/enums.dart';
import 'package:flutter_clock/modals/menu_info.dart';
import 'package:flutter_clock/views/alarm_page.dart';
import 'package:flutter_clock/views/clock_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems.map((currentMenu) => buildMenuButton(currentMenu)).toList(),
          ),
          VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (BuildContext context, MenuInfo value, Widget? child) {
                if (value.menuType == MenuType.clock) {
                  return ClockPage();
                } else {
                  return AlarmPage();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    var menuBackgroundColor = MaterialStateProperty.all(CustomColors.menuBackgroundColor);
    var transparent = MaterialStateProperty.all(Colors.transparent);
    var shape = MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(32))));
    return Consumer(
      builder: (BuildContext context, MenuInfo value, Widget? child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: TextButton(
            style: ButtonStyle(
                shape: shape,
                backgroundColor:
                    currentMenuInfo.menuType == value.menuType ? menuBackgroundColor : transparent),
            onPressed: () {
              var menuInfo = Provider.of<MenuInfo>(context, listen: false);
              menuInfo.updateMenu(currentMenuInfo);
            },
            child: Column(
              children: [
                Image.asset(
                  currentMenuInfo.imageSource.toString(),
                  scale: 1.5,
                ),
                SizedBox(height: 16),
                Text(
                  currentMenuInfo.title.toString(),
                  style: TextStyle(fontFamily: 'avenir', color: Colors.white, fontSize: 14),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
