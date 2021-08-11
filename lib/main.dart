import 'package:flutter/material.dart';
import 'package:flutter_clock/enums.dart';
import 'package:flutter_clock/modals/menu_info.dart';
import 'package:provider/provider.dart';
import 'views/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<MenuInfo>(
        create: (BuildContext context) => MenuInfo(MenuType.clock),
        child: HomePage(),
      ),
    );
  }
}
